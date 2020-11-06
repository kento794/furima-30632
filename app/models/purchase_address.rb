class PurchaseAddress
    include ActiveModel::Model
    attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token
    
    with_options presence: true do    
        validates :user_id
        validates :item_id
        validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" }                
        validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
        validates :city          
        validates :address
        validates :phone_number, format: { with: /\A\d{11}\z/ }             
        validates :token, presence: {message: "can't be blank"}
    end
    

    def save
       test = Purchase.create(
        user_id: user_id, 
        item_id: item_id
      )
      Address.create(
        purchase_id: test.id,           
        post_code: post_code,
        prefecture_id: prefecture_id, 
        city: city, 
        address: address, 
        building_name: building_name,
        phone_number: phone_number)
    end
end

