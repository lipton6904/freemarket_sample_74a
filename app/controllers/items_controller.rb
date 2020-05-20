class ItemsController < ApplicationController

  before_action :set_product, except: [:index, :new, :create]
  
  def index
  end

  def new
    @parents = Category.order("ancestry,id").limit(13)
    @item = Item.new
    @item.images.new
    # @images = @item.images.new 
    # @item.images.build
  end
  
  def show
    @items = Item.includes(:images).order('created_at DESC')
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
  end

private

  def item_params
    params.require(:item).permit(:name, :price_id, :explanation, :category_id, :size_id, :condition_id, :derivery_fee_id, :shipping_area_id, :days_untill_shipping_id, :status_id,images_attributes: [:image, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end


  # def set_categor
  # @smallcategory =Category.find(Category.find(@items.category_id).
  # @category = Category.find(Category.find(@items.category_id). 
  # @bigcategory = Category.find(Category.find(@items.category_id)
  # end

end