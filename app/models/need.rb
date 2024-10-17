class Need < ApplicationRecord
  belongs_to :organization
  has_many :organization_need_assignments, dependent: :destroy
  has_many :organizations, through: :organization_need_assignments
  has_many :volunteer_need_assignments, dependent: :destroy

  validates :title, presence: true
end