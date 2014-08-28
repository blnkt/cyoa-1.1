class ChangeTableAvatars < ActiveRecord::Migration
  def change
  	change_table(:avatars) do |t|
  t.string :name
  end
  end
end
