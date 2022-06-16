class ChangeProjects < ActiveRecord::Migration[6.1]
  def change 
    add_column :projects, :date_start, :datetime
    add_column :projects, :date_end, :datetime
    remove_column :projects, :date, :string 
  end
end
