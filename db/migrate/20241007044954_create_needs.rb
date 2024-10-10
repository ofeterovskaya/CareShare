class CreateNeeds < ActiveRecord::Migration[7.1]
  def change
    create_table :needs do |t|
      t.string :title
      t.text :description
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end   
  end
end
