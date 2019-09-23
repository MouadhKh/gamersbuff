class Contact < MailForm::Base
  attribute :username, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message

# Declare the e-mail headers. It accepts anything the mail method
# in ActionMailer accepts.
  def headers
    {
      :subject => "Contact Form Inquiry",
      :to => "your_email@your_domain.com",
      :from => %("#{username}" <#{email}>)
    }
  end
end
