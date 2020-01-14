class Contact < ApplicationRecord
  belongs_to :event
  validates :title,  presence: true
  validates :email,  presence: true
  validates :content,  presence: true
end
