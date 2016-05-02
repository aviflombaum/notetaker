class AddReferenceIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :reference_id, :integer
  end
end
