class StaticPagesController < ApplicationController
  def home
    @user = User.find(current_user.id) if current_user
  end

  def login_home
    @user = User.find(current_user.id) if current_user
    @review_count = Review.count(user_id = current_user.id)
  end
end
