require 'telegram/bot'

token = '459345148:AAFwUHa4-iNaQoHlSavdVFY662DL-IDIf0M'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/chatid'
      bot.api.send_message(chat_id: message.chat.id, text: "Here is the chat id: #{message.chat.id}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
