# frozen_string_literal: true

class RemoveEdateFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :e_date, :datetime
  end
end
