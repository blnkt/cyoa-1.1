class ChangeDitchPasswords < ActiveRecord::Migration
  def change
  	change_table(:users) do |t|
  t.remove :hashed_password
  end
  end
end
