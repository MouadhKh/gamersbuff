class Contact < MailForm::Base
  attribute :username
  validates :username, presence: true, length: {minimum: 4, maximum: 15}

  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  validates :message, presence: true, length: {minimum: 100, maximum: 500}

  # attribute :nickname, :captcha => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "#{username} contacted you , Hurry to answer",
      :to => "gam3rsbuff@gmail.com",
      :from => %("#{username}" <#{email}>)    }
  end
end
