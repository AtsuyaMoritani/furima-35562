class ItemsController < ApplicationController
  #before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index]
  def index
    
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
    render :new
   end
  end
end

private 

def item_params
   params.require(:item).permit(:product_name, :category_id, :price, :product_description, :product_condition_id, :ship_base_id, :region_id, :ship_date_id, :image).merge(user_id: current_user.id)
end
 #def set_prototype
 #  @item = item.find(params[:id])
 #end