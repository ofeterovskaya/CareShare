class CreateVolunteerNeeds < ActiveRecord::Migration[7.1]
  def change
    create_table :volunteer_needs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.string :status, default: 'pending'
      t.timestamps
    end
  end
end