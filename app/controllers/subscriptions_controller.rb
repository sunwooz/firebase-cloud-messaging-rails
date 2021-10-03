class SubscriptionsController < ApplicationController
  
  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      flash.now[:notice] = 'Request was saved successfully.'
      respond_to do |format|
        format.json { render json: @subscription }
      end
    else
      redirect_to root, flash: { error: "Something went wrong!" }
    end
  end
  
  def send_test
    options = { 
      "notification": {
        "title": params[:title],
        "body": params[:description]
      }
    }
    
    registration_ids = Subscription.all.pluck(:user_token).uniq
    response = ::Fcm.send(registration_ids, options)
    respond_to do |format|
      format.json
    end
  end
  
  private
  
  def subscription_params
    params.permit('country_citizen', 'country_destination', 'user_token')
  end
end