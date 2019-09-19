class ContactController < ApplicationController
  def index
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    byebug
    respond_to do |format |

      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Contact.new
        format.html {render 'index', notice: "Thank you for your message. We'll get back to you soon!"}
        #format.js   { flash.now[:success] = @message = "Thank you for your message. We'll get back to you soon!" }
      else
        format.html {render 'index', notice: "Something went wrong ! Message not sent "}
      end
    end
  end
end
