class Contact < MailForm::Base
  attribute :username, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname, :captcha => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "#{username} contacted you , Hurry to answer",
      :to => "gam3rsbuff@gmail.com",
      :from => %("#{username}" <#{email}>)
    }
  end
end
