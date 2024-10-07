class Need < ApplicationRecord
  belongs_to :organization
  has_many :volunteer_need_assignments  
end