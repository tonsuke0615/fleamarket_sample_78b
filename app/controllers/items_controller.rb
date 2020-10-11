class ItemsController < ApplicationController
  before_action :set_parents, only: [:new, :create]

  def index
    @items = Item.order("id DESC").limit(5)
    @item_images = ItemImage.all
    @randoms = Item.order("RANDOM(categry_id)").limit(5)
  end

  def new 
    @item = Item.new
    @item_image = ItemImage.new
  end

  def create
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandchildrens = Category.find(params[:children_id]).children
        end
      end
    end
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
