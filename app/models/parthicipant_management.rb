# frozen_string_literal: true

class ParthicipantManagement < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
