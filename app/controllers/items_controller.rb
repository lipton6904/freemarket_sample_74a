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
    @item = Item.find(params[:id])
    @items = Item.includes(:images).order('created_at DESC')
    @user = User.find_by(id: @item.seller_id)
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def category_children
    @category_children = Categorie.find(params[:productcategory]).children 
  end
    
  def category_grandchildren
    @category_grandchildren = Categorie.find(params[:productcategory]).children
  end



private
  def item_params
    params.require(:item).permit(:name, :price_id, :explanation, :category_id, :size_id, :condition_id, :derivery_fee_id, :shipping_area_id, :days_untill_shipping_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end