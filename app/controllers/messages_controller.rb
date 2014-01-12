class MessagesController < ApplicationController
  respond_to :json, :xml

  def index
    if params['last_message_id']
      @messages = Message.where("id > #{params['last_message_id']}")
    else
      @messages = Message.last(5)
    end
    render :json => @messages
  end

  def create
    message = Message.create(:text => params[:text], :user => params[:user])

    if message.persisted?
      render :json => { :message => message, :status => 201 }
    else
      render :json => { :error => message.errors.full_messages.join(", "), :status => 304 }
    end
  end
end
