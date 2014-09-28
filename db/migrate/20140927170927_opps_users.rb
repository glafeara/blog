class OppsUsers < ActiveRecord::Migration
  def change
    remove_column :users, :checked
    add_column    :users, :checked, :boolean, default: false
  end
end
