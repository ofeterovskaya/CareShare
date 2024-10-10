class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :contact_email
      t.string :location

      t.timestamps
    end
  end
end
