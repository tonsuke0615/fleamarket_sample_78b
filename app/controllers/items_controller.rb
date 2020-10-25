class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_parents, only: [:new, :create]

  def index
    @items = Item.order("id DESC").limit(5)
  end

  def new 
    @item = Item.new
    @item.item_images.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "出品が完了しました"
      
    else
      flash.now[:alert] = "必須情報が不足しています"
      render :new, locals: {item: new}
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
    params.require(:item).permit(:name, :price, :detail, :brand, :category_id, :condition_id , :shippingFee_id , :shippingFrom_id, :preparationDay_id , item_images_attributes: [:src]).merge(user_id: current_user.id)
  end

end
