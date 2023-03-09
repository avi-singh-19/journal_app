class Item < ApplicationRecord
  validates_presence_of :name, :description, alert: "Error"

  belongs_to :user
  has_one_attached :image
end
