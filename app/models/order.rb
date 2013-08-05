class Order < ActiveRecord::Base
  attr_accessible :email, :phone, :username

  after_create :send_notification

  def send_notification
    response = HTTParty.get(
        'http://api.sms24x7.ru',
        query: {
            method: 'push_msg',
            email: 'agatovs@gmail.com',
            password: 'avv6rqE',
            phone: '79037928959',
            text: sms_text,
            sender_name: 'montale'
        }
    )

    if response.parsed_response['response']['msg']['text'] == 'OK'
      true
    else
      false
    end
  end

  def sms_text
    I18n.translate(
        'sms.notification_message',
        username: username,
        phone: phone,
        date: created_at.strftime('%d %b')
    )
  end
end
