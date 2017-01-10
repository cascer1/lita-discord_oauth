require 'discordrb'

module Lita
  module Adapters
    class Discord_oauth < Adapter
      config :token, type: String, required: true
      config :client, type: String, required: true

      def initialize(robot)
        super
        @client = ::Discordrb::Bot.new token: config.token, client_id: config.client
      end

      def run
        STDOUT.write('Starting')
        @client.ready do |e|
          robot.trigger(:connected)

          @client.message do |event|
            message = event.message
            author_id = message.author.id.to_s

            Lita.logger.debug('Message: ' + message.content)
            Lita.logger.debug('Author ID: ' + author_id)

            user = Lita::User.find_by_id(author_id)
            user = Lita::User.create(user) unless user

            Lita.logger.debug('User ID: ' + user.id)

            channel = event.channel.id

            source = Lita::Source.new(user: user, room: channel)
            msg = Lita::Message.new(robot, message.content, source)

            robot.receive(msg) #unless message.from_bot?

          end
        end


        @client.run
      end

      def shut_down
        @client.stop
      end

      def send_messages(target, messages)
        Lita.logger.debug('Target: ' + target)
        Lita.logger.debug('Target user: ' + target.user)
        Lita.logger.debug('Target user ID: ' + target.user.id)

        mention = @client.user(target.user.id).mention

        Lita.logger.debug('Mention: ' + mention)

        messages.each do |message|
          if mention
            message = mention + ',\n' + message

            Lita.logger.debug(message)

            @client.send_message(target.room, message)
          end
        end
      end

    end

    Lita.register_adapter(:discord_oauth, Discord_oauth)
  end
end
