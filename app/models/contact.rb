class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname, :captcha => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "#{name} contacted you , Hurry to answer",
      :to => ENV['GMAIL_EMAIL'],
      :from => %("#{name}" <#{email}>)
    }
  end
end
