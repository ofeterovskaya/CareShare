class OrganizationNeedAssignment < ApplicationRecord
  belongs_to :organization
  belongs_to :need
  belongs_to :user, class_name: 'User', optional: true
end
