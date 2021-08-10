class Order < ApplicationRecord
  with_options presence: true do
    validates :user, :product
  end

  belongs_to :user
  belongs_to :product
  has_one :buy
end
