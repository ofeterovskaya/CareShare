class VolunteerNeedAssignment < ApplicationRecord
  belongs_to :volunteer
  # belongs_to :user I'm not sure if this is correct
  belongs_to :need
end
