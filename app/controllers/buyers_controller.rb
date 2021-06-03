class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]


    def index
      @item_address = ItemAddress.new
    end

    def create
      @item_address = ItemAddress.new(buyer_params)
      if @item_address.valid?
        pay_item = @item.price
        @item_address.save
        return redirect_to root_path
      else
        render :index
      end
    end
    
      private
    
      def buyer_params
        params.require(:item_address).permit(:postal_code, :region_id, :city, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
      end

      def set_item
        @item = Item.find(params[:item_id])
        if current_user == @item.user || @item.buyer != nil
          redirect_to root_path
        end
      end
    
      def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: buyer_params[:price],
          card: buyer_params[:token],
          currency: 'jpy'
        )
      end
end
