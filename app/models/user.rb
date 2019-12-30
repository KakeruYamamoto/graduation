class User < ApplicationRecord
  mount_uploader :icon, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favorites, dependent: :destroy
  has_many :parthicipant_managements, dependent: :destroy
  has_many :events
  has_many :favorite_events, through: :favorites, source: :event
  validates :name, presence: true, length: { maximum: 30 }
  validates :email,presence: true, length: { maximum: 255 }, uniqueness: true,
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
