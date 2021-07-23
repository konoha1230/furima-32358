class Product < ApplicationRecord
  with_options presence: true do
    validates :name, :content, :user, :image
    validates :price, numericality: true
    validates_inclusion_of :price, in: 300..9_999_999
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :status_id, :delivery_charge_id, :category_id, :prefecture_id, :duration_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :duration
end
