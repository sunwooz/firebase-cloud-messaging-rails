class PagesController < ApplicationController
  def main
  end
  
  def admin
    @tokens = Subscription.all.pluck(:user_token)
  end
end
