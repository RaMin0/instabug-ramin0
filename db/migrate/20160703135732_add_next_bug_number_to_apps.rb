class AddNextBugNumberToApps < ActiveRecord::Migration
  def change
    add_column :apps, :next_bug_number, :integer, default: 1
  end
end
