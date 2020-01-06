class RemoveOidFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :o_id, :integer
  end
end
