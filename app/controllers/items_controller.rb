class ItemsController < ApplicationController
<<<<<<< Updated upstream
=======

  before_action :set_item, except: [:index, :new, :create]
  
>>>>>>> Stashed changes
  def index
  end

  def new
    @parents = Category.all.order("ancestry,id").limit(13)
    @item = Item.new
    @item.images.new
<<<<<<< Updated upstream
    # @item.images.new 
    # @images = @item.images.new 
    # @item.images.build
=======
>>>>>>> Stashed changes
  end
  
  def show
    @items = Item.includes(:images).order('created_at DESC')
  end

  def create
    @item = Item.new(item_params)
<<<<<<< Updated upstream
    @item.save!
    redirect_to root_path
    # else
    #   # render :index
    # end
=======
    if  @item.save
    else
      redirect_to root_path
    end
>>>>>>> Stashed changes
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def item_params
    params.require(:item).permit(:name, :price_id, :explanation, :category_id, :size_id, :condition_id, :derivery_fee_id, :shipping_area_id, :days_untill_shipping_id, :status_id,images_attributes: {image: []})
  end
  
end