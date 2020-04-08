# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :event
  validates :title, presence: true, length: { maximum: 75 }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :content, presence: true
end
