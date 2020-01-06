class Event < ApplicationRecord
  # has_many :favorites, dependent: :destroy
  # has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :parthicipant_managements, dependent: :destroy
  has_many :parthicipant_events, through: :parthicipant_managements, source: :user

  has_many :labelings, dependent: :destroy, foreign_key: 'event_id'
  has_many :labels, through: :labelings, source: :label

  validates :content,  presence: true
  validates :title,  presence: true
end
