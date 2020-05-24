class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :destroy, :show]
  def index
    @items = Item.all
  end

  def new
    @category = Categorie.all.order("ancestry,id").limit(13)
    @item = Item.new
    @item.images.new
  end
  
  def show
    @items = Item.includes(:images).order('created_at DESC')
    @user = User.find_by(id: @item.seller_id)
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path, notice: '出品が完了しました'
    else
      redirect_to root_path
    end
  end

  def edit
    @category = Categorie.order("ancestry,id").limit(13)
    @item.images.find(params[:id])
  end

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  def destroy
    if user_signed_in? && current_user.id == @item.seller_id
      if@item.destroy
        redirect_to root_path, notice: '削除が完了しました'
      else
        redirect_to root_path, notice: '削除できませんでした'
      end
    else
      redirect_to root_path, notice: '権限がありません'
    end
  end

  def category_children
    @category_children = Categorie.find(params[:productcategory]).children 
  end
    
  def category_grandchildren
    @category_grandchildren = Categorie.find(params[:productcategory]).children
  end



private
  def item_params
    params.require(:item).permit(:name, :price_id, :explanation, :categorie_id, :size_id, :condition_id, :derivery_fee_id, :shipping_area_id, :days_untill_shipping_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
    
  end
end
