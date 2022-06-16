class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :activity_id, :integer
  end
end
