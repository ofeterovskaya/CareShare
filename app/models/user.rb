class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Connections
  belongs_to :organization, optional: true  # Optional if it's from organization
  has_many :volunteer_need_assignments, foreign_key: :volunteer_id
  has_many :volunteer_needs, through: :volunteer_need_assignments, source: :need

  # Validations
  validates :first_name, :last_name, :role, presence: true
  validates :role, inclusion: { in: %w[volunteer organization] }
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}\z/,
    message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character" }

  # New fields
  validates :about, length: { maximum: 500 }, allow_nil: true
  validates :help_option, inclusion: { in: [
    'Hygiene products', 
    'Kitchenware', 
    'Clothes', 
    'Shoes', 
    'Books', 
    'Time', 
    'Emotional support', 
    'Carpool'
  ] }, allow_nil: true

  # Avatar using ActiveStorage
  has_one_attached :avatar
end
