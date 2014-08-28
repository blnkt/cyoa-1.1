class AddColumnToAvatars < ActiveRecord::Migration
  def change
  	change_table(:avatars) do |t|
  t.belongs_to :user
  end
  end
end
