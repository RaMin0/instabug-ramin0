class ChangeStatusDefaultInBugs < ActiveRecord::Migration
  def change
    change_column_default :bugs, :status, :new
  end
end
