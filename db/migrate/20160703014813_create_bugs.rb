class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.belongs_to :app, index: true, foreign_key: true
      t.integer    :number, default: 1
      t.string     :status, default: :open
      t.string     :priority, default: :minor

      t.timestamps null: false
    end
    
    add_index :bugs, [:app_id, :number], unique: true
    add_index :bugs, :status
    add_index :bugs, :priority
  end
end
