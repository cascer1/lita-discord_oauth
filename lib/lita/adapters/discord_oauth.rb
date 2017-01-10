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

          version = Gem.loaded_specs['lita-discord_oauth'].version

          @client.game = "Version #{version}"

          @client.message do |event|
            message = event.message
            author_id = message.author.id.to_s
            author_name = message.author.display_name.to_s

            Lita.logger.debug("Received message from #{author_name}(#{author_id}): #{message.content}")
            Lita.logger.debug("Finding user #{author_name}")

            user = Lita::User.find_by_name(author_name)

            if user == nil
              Lita.logger.debug("User #{author_name} not found, trying ID #{author_id}")
              user = Lita::User.find_by_id(author_id)

              if user != nil
                Lita.logger.debug("User #{author_id} found, updating name to #{author_name}")
                user = Lita::User.create(author_id, {name: author_name})
              end

              Lita.logger.debug("User #{author_id} not found, creating now")
              user = Lita::User.create(author_id, {name: author_name}) unless user
            end

            Lita.logger.debug('User ID: ' + user.id)

            channel = event.channel.id.to_s

            Lita.logger.debug('Channel ID: ' + channel)

            source = Lita::Source.new(user: user, room: channel)
            msg = Lita::Message.new(robot, message.content, source)

            robot.receive(msg) unless message.from_bot?

          end
        end


        @client.run
      end

      def shut_down
        @client.stop
      end

      def send_messages(target, messages)
        Lita.logger.debug('Target user ID: ' + target.user.id)
        Lita.logger.debug('Target channel ID: ' + target.room)

        mention = @client.user(target.user.id).mention

        Lita.logger.debug('Mention: ' + mention)

        messages.each do |message|
          if mention
            message = mention + ",\n" + message

            Lita.logger.debug(message)

            @client.send_message(target.room, message)
          end
        end
      end

    end

    Lita.register_adapter(:discord_oauth, Discord_oauth)
  end
end
