class ItemsController < ApplicationController

  before_action :set_item, except: [:index, :new, :create, :update, :show]
  
  def index
  end

  def new
    @parents = Category.order("ancestry,id").limit(13)
    @item = Item.new
    @item.images.build
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
    @parents = Category.order("ancestry,id").limit(13)
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
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

  def update
    binding.pry
    @item.update(item_params)
    redirect_to root_path
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
