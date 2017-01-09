require 'discordrb'

module Lita
  module Adapters
    class Discord_oauth < Adapter
      # insert adapter code here
      config :token, type: String, required: true
      config :client, type: String, required: true
      config :prefix, type: String, required: true

      def initialize(robot)
        super
        @client = ::Discordrb::Bot.new token: config.token, client_id: config.client
      end

      def run
        @client.run


        @client.ready do
          robot.trigger(:connected)
        end

        @client.message do |event|
          message = event.message
          message_text = message.content

          user = Lita::User.find_by_id(message.author.id)
          user = Lita::User.create(user) unless user

          channel = event.channel.id

          source = Lita::Source.new(user: user, room: channel)
          msg = Lita::Message.new(robot, message_text, source)

          robot.receive(msg) #unless message.from_bot?

        end

        @client.run
      end

      def shut_down
        @client.stop
      end

      def send_messages(target, messages)
        mention = @client.user(target.user).mention

        messages.each do |message|
          if mention
            message = mention + ',\n' + message

          @client.send_message(target.channel, message)
          end
        end
      end

    end

    Lita.register_adapter(:discord_oauth, Discord_oauth)
  end
end
