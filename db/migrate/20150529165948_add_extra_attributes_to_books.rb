class AddExtraAttributesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :publisher, :string
    add_column :books, :year, :integer
    add_column :books, :genre, :string
  end
end
