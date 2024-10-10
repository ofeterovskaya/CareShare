class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Connections
  belongs_to :organization, optional: true  # Optional if it's from organization
  has_many :volunteer_needs
  has_many :volunteer_need_assignments
  has_many :needs, through: :volunteer_need_assignments  # connection through volunteer_need_assignments

  # Validations
  validates :first_name, :last_name, :role, presence: true
  validates :role, inclusion: { in: %w[volunteer organization] }
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}\z/,
    message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character" }
end