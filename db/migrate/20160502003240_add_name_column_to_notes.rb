class AddNameColumnToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :name, :string
  end
end
