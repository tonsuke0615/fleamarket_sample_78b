class ItemsController < ApplicationController
  def index
  end

  def new 
    @parents = Category.all.order("id ASC").limit(13)
    # @item.item_images.new

  end
  
end
