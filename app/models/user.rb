class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /^\d{10}$|^\d{11}$/, multiline: true }

end
