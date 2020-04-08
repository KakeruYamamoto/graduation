# frozen_string_literal: true

class CreateParthicipantManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :parthicipant_managements do |t|
      t.integer :parthicipant_id
      t.integer :event_id

      t.timestamps
    end
  end
end
