class AddBugsCountAndBugsCountUpdatedAtToApps < ActiveRecord::Migration
  def change
    add_column :apps, :bugs_count, :integer, default: 0
    add_column :apps, :bugs_count_updated_at, :datetime
  end
end
