class OrganizationNeedAssignment < ApplicationRecord
  belongs_to :organization
  belongs_to :need
end
