class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.datetime :date_start
      t.datetime :date_end
      t.boolean :finished, default: false 

      t.timestamps
    end
  end
end
