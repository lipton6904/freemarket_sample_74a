class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  def index
  end

  def new
    @parents = Category.all.order("ancestry,id").limit(13)
    # @category_parent_array = ["選択してください"] 
    # @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    # @category_parent_array = ["---"]
    # Category.where(ancestry: nil).each do |parent|
    #   @category_parent_array << parent.name
    @item = Item.new
    @item.images.new
  end
  
  def show
    @items = Item.includes(:images).order('created_at DESC')
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

  def get_category_children
    binding.pry
    # respond_to do |format| 
    #   format.html
    #   format.json do
    @children = Category.find(params[:parent_id]).children
    #   end
    # end
  end
  def get_category_grandchildren
    # respond_to do |format| 
    #   format.html
    #   format.json do
    @grandchildren = Category.find("#{params[:child_id]}").children
    #   end
    # end
  end
private
  def item_params
    params.require(:item).permit(:name, :price_id, :explanation, :category_id, :size_id, :condition_id, :derivery_fee_id, :shipping_area_id, :days_untill_shipping_id, :status_id, images_attributes: [:id, :image, :_destroy])
    # .merge(user_id: current_user.id, status: 0)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def set_category
  # @children =Category.find(Category.find(@items.category_id).
  # @category = Category.find(Category.find(@items.category_id). 
  # @grandchildren = Category.find(Category.find(@items.category_id)
  # end

end