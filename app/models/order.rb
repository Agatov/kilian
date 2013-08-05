class Order < ActiveRecord::Base
  attr_accessible :email, :phone, :username

  after_create :send_notification

  def send_notification
    phones = %w(79037928959 79057376916)

    phones.each do |phone|
      HTTParty.get(
          'http://api.sms24x7.ru',
          query: {
              method: 'push_msg',
              email: 'agatovs@gmail.com',
              password: 'avv6rqE',
              phone: phone.to_s,
              text: sms_text,
              sender_name: 'kilian'
          }
      )
    end

    true
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
