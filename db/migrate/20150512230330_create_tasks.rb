class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :author
      t.string :title
      t.string :description
      t.integer :duration
      t.date :begindate
      t.date :duedate
      t.integer :responsible
      t.boolean :completed

      t.timestamps
    end
  end
end
