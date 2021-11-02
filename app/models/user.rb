class User < ApplicationRecord
  has_one_attached :avatar
  has_many :user_plans
  has_many :plans, through: :user_plans
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
end
