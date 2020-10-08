class ItemsController < ApplicationController
  before_action :set_parents, only: [:new, :create]

  def index
  end

  def new 
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  # まだ機能実装していないのでコメントアウト
  # def destroy
  # end

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

private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def item_params
    params.require(:item).permit(:name, :price, :detail, :brand, :category_id, :condition_id , :shippingFee_id , :shippingFrom_id, :preparationDay_id , item_images_attributes: [:src])
  end

end
