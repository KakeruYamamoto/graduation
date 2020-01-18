class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :parthicipant_managements, dependent: :destroy
  has_many :parthicipante_users, through: :parthicipant_managements, source: :user
  has_many :labelings, dependent: :destroy, foreign_key: 'event_id'
  has_many :labels, through: :labelings, source: :label

  validates :content,  presence: true
  validates :title,  presence: true, length:{maximum:75}
  validates :e_date_start, presence: true
  validates :address, presence: true
end
