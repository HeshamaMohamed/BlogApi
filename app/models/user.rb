class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  validates :name, presence: true, length: { within: 6..32 }, format: { with: /\A[a-zA-Z\s]*\Z/, message: 'can contain alphabets only' }
end