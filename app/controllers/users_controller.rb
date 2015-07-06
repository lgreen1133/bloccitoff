class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
    @new_item = Item.new
    @items = @user.items
  end
end