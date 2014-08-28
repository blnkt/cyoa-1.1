class RemoveTable < ActiveRecord::Migration
  def change
  	drop_table :table_rspecs
  end
end
