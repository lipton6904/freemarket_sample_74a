class ItemsController < ApplicationController


  before_action :set_item, only: [:edit,:show,:destroy,:update]

  

  before_action :set_item, only: [:edit,:update, :destroy, :show]


  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @category = Categorie.all.order("ancestry,id").limit(13)
      @item = Item.new
      @item.images.new
    else
      redirect_to new_user_session_path
    end
  end
  
  def show
    @items = Item.includes(:images).order('created_at DESC')
    @user = User.find_by(id: @item.seller_id)
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path, notice: '出品完了しました'
    else
      flash[:alert] = '出品できませんでした'
      redirect_to action: "new"
    end
  end

  def edit
    @category = Categorie.order("ancestry,id").limit(13)
    # 親セレクトボックスの初期値
    @category_parent_array = Categorie.where(ancestry: nil)
    @category_child_array = @item.categorie.parent.parent.children
    @category_grandchild_array = @item.categorie.parent.children
  end

  def update

    if  @item.update(item_params)
      redirect_to root_path, notice: '編集完了しました'
    else
      flash[:alert] = '編集できませんでした'
      redirect_to action: "edit"
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.seller_id
      if @item.destroy
        redirect_to root_path, notice: '削除が完了しました'
      else
        redirect_to root_path, alert: '削除できませんでした'
      end
    else
      redirect_to root_path, alert: '権限がありません'
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
    params.require(:item).permit(:name, :price_id, :explanation, :categorie_id, :size, :condition_id, :derivery_fee_id, :shipping_area_id, :days_untill_shipping_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
