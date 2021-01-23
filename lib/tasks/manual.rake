namespace :push_message do 
  desc "低気圧通知" 
  task kiatsu_alert: :environment do
    message = {
      type: 'text',
      text: "今日は低気圧なので注意しましょう"
    }

    client = Line::Bot::Client.new { |config|
      config.channel_secret = "ab0db3d8a15ea6a0dd128451c876721f"
      config.channel_token = "6tRR8tzRKN0HQlNDD2nE5Xl4xnp9dqlSuCCPncD6Gnh3VUXG9hWelC9/MKqhunpDmR7FCCKrAsZ5Q4PRWDu+baKCaU2ubcQZNiTqyEf18StXt7bjUAJQ06QJONdSnN+bNdOsOWF5O06GUIPA6N+jIgdB04t89/1O/w1cDnyilFU="
    }

    LineUser.all.each do |user|
      client.push_message(user.line_id, message)
    end
  end
end