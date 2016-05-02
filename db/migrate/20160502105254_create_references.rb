class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :reference_link

      t.timestamps null: false
    end
  end
end
