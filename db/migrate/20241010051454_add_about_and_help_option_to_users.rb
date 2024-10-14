class AddAboutAndHelpOptionToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :about, :text
    add_column :users, :help_option, :string
  end
end
