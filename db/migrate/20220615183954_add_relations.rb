class AddRelations < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :activity_id, :integer
    add_column :activities, :project_id, :integer

    add_index :projects, :activity_id
    add_index :activities, :project_id
  end
end
