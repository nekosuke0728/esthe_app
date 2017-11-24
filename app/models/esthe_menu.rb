class EstheMenu < ApplicationRecord
  has_many :reservations, dependent: :restrict_with_error

  validates :name, presence: true
  validates :time_frame, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
