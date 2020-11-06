class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @purchase_address = PurchaseAddress.new
    if @item.user == current_user
      redirect_to root_path
    end
    if @item.purchase != nil
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid? 
        pay_item
        @purchase_address.save
        redirect_to root_path
      else
        render :index
      end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],    
      currency: 'jpy'
  )
  end

  private
 
  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def item_params
    params.require(:item).permit(:name, :discription, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handing_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end 

