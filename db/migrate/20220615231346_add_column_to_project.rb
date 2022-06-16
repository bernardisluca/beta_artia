class AddColumnToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :percentage_complete, :float
    add_column :projects, :is_late, :boolean  
  end
end
