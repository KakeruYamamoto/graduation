class User < ApplicationRecord
  mount_uploader :icon, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :feeds
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
