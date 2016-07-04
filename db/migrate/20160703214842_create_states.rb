class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.belongs_to :bug, index: true, foreign_key: true
      t.string  :device
      t.string  :os
      t.integer :memory
      t.integer :storage

      t.datetime :created_at, null: false
    end
  end
end
