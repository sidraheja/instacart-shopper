class ShopperSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :phone
end