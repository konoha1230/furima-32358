class Product < ApplicationRecord
  with_options presence: true do
    validates :name, :content, :price, :status_id, :delivery_charge_id, :category_id, :prefecture_id, :duration_id, :user
  end

  belongs_to :user
  has_one_attached :image
end
