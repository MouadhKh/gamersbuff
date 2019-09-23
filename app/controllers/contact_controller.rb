class ContactController < ApplicationController
  def index
    @contact = Contact.new(params[:contact])
  end


  def create
    if !verify_recaptcha(model: @contact)
      redirect_to contact_index_path, alert: 'Please solve the captcha first'
    else

      @contact = Contact.new(params[:contact])
      @contact.request = request
      respond_to do |format|
        if @contact.deliver
          @contact = Contact.new
          format.html {redirect_to root_path, notice: "Thank you for your message. We'll get back to you soon!"}
        else
          format.html {render :index, alert: "Something went wrong ! Message not sent "}
        end
      end
    end
  end

end
