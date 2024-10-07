# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # t.string :email,              null: false, default: "" # Убедитесь, что эта строка не добавляется снова
      # t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      # t.string   :reset_password_token # Удалите или закомментируйте эту строку
      # t.datetime :reset_password_sent_at # Удалите или закомментируйте эту строку

      ## Rememberable
      # t.datetime :remember_created_at # Удалите или закомментируйте эту строку

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false # Удалите или закомментируйте эту строку
      # t.datetime :current_sign_in_at # Удалите или закомментируйте эту строку
      # t.datetime :last_sign_in_at # Удалите или закомментируйте эту строку
      # t.string   :current_sign_in_ip # Удалите или закомментируйте эту строку
      # t.string   :last_sign_in_ip # Удалите или закомментируйте эту строку

      ## Confirmable
      # t.string   :confirmation_token # Удалите или закомментируйте эту строку
      # t.datetime :confirmed_at # Удалите или закомментируйте эту строку
      # t.datetime :confirmation_sent_at # Удалите или закомментируйте эту строку
      # t.string   :unconfirmed_email # Удалите или закомментируйте эту строку

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Удалите или закомментируйте эту строку
      # t.string   :unlock_token # Удалите или закомментируйте эту строку
      # t.datetime :locked_at # Удалите или закомментируйте эту строку
    end

    # Удалите добавление индекса для reset_password_token
    # add_index :users, :reset_password_token, unique: true
  end

  def self.down
    # Удалите только те поля, которые вы добавили в этой миграции
    change_table :users do |t|
      t.remove :reset_password_token if column_exists?(:users, :reset_password_token)
      t.remove :reset_password_sent_at if column_exists?(:users, :reset_password_sent_at)
      t.remove :remember_created_at if column_exists?(:users, :remember_created_at)
    end
  end
end
