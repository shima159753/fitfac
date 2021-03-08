class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: 'web-site@example.com', subject: 'お問い合わせ内容'
  end
end
