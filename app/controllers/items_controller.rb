class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

    def create
      @item = current_user.items.build(item_params)

      if @item.save 
      flash[:notice] = "Item was added to the list"
      redirect_to current_user
      else
      flash[:error] = "There was an error adding the item. Please try again."
      render :new
      end
    end

    def destroy
      @item = Item.find(params[:id])

      if @item.destroy
        flash[:notice] = "Item was deleted."
      else
        flash[:error] = "There was an error deleting the item. Please try again."
      end
      redirect_to current_user
    end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
