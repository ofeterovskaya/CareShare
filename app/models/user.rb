class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable

  # Connections
  belongs_to :organization, optional: true  # Опционально, если это представитель
  has_many :volunteer_need_assignments
  has_many :needs, through: :volunteer_need_assignments  # Связь через нужды
end
