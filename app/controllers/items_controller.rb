class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_parents, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.order("id DESC").limit(5)
  end

  def new 
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "出品が完了しました"
      
    else
      flash.now[:alert] = "必須情報が不足しています"
      render :new, locals: {item: new}
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  def show
  end

  def destroy
    unless @item.destroy
      redirect_to item_path(@item.id), alert: '削除に失敗しました'
    end
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

  private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def item_params
    params.require(:item).permit(:name, :price, :detail, :brand, :category_id, :condition_id , :shipping_fee_id , :shipping_from_id, :preparation_day_id , item_images_attributes: [:src]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end