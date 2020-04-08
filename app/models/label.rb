# frozen_string_literal: true

class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy, foreign_key: 'label_id'
  has_many :events, through: :labelings, source: :event
end
