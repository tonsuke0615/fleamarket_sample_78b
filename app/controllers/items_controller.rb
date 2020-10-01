class ItemsController < ApplicationController
  def index
  end

  def new 
    @item = Item.new
    # @item.item_images.new
    @parents_category = Category.where(ancestry: nil) 
    # @children = Category.find(params[:parent_id]).children
  end
  
end
