class VolunteerNeed < ApplicationRecord
  belongs_to :organization
  has_many :volunteer_need_assignments, foreign_key: :need_id
  has_many :volunteers, through: :volunteer_need_assignments, source: :volunteer
end