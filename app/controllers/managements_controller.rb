class ManagementsController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def submissions
    @posts = Post.where(user_id: current_user.id)
  end
end
