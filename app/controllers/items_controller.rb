class ItemsController < ApplicationController
  
  def index
  end

  def new
    @category = Category.all.order("ancestry,id").limit(13)
    @item = Item.new
    @item.images.new
  end
  
  def show
    @items = Item.includes(:images).order('created_at DESC')
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
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
    @category_children = Category.find(params[:productcategory]).children 
  end
    
  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
  end

private
  def item_params
    params.require(:item).permit(:name, :price_id, :explanation, :category_id, :size_id, :condition_id, :derivery_fee_id, 
      :shipping_area_id, :days_untill_shipping_id, :status_id,images_attributes: [:image, :_destroy, :id])
  end

end