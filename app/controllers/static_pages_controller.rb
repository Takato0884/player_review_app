class StaticPagesController < ApplicationController
  def home
    @user = User.find(current_user.id) if current_user
  end

  def temporary
  end
end
