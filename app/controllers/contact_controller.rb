class ContactController < ApplicationController
  def index
    @contact = Contact.new(params[:contact])
  end


  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|

      if @contact.deliver
        # re-initialize Home object for cleared form
        if verify_recaptcha(model: @contact)
          redirect_to root_path
        end
        @contact = Contact.new
        format.html {redirect_to root_path, notice: "Thank you for your message. We'll get back to you soon!"}
        #format.js   { flash.now[:success] = @message = "Thank you for your message. We'll get back to you soon!" }
      else
        format.html {redirect_to contact_index_path, alert: "Something went wrong ! Message not sent "}
      end
    end
  end
end
