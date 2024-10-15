class Organization < ApplicationRecord
  belongs_to :user
  has_many :organization_need_assignments
  has_many :needs, through: :organization_need_assignments 
  after_create :create_default_needs

  private

  def create_default_needs
    Need.create([
      { title: 'Hygiene products', organization_id: self.id }, 
      { title: 'Kitchenware', organization_id: self.id }, 
      { title: 'Clothes', organization_id: self.id }, 
      { title: 'Shoes', organization_id: self.id }, 
      { title: 'Books', organization_id: self.id }, 
      { title: 'Time', organization_id: self.id }, 
      { title: 'Emotional support', organization_id: self.id }, 
      { title: 'Carpool', organization_id: self.id }
    ])
  end
end