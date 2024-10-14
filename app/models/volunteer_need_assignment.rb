class VolunteerNeedAssignment < ApplicationRecord
  belongs_to :volunteer, class_name: 'User'
  belongs_to :need, class_name: 'VolunteerNeed'
end