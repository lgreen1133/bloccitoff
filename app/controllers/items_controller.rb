class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

    def create
      @item = current_user.items.build(item_params)

      if @item.save 
      flash[:notice] = "Item was added to the list"
      redirect_to @item
      else
      flash[:error] = "There was an error adding the item. Please try again."
      render :new
      end
    end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
