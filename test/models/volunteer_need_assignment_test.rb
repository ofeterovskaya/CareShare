require "test_helper"

class VolunteerNeedAssignmentTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    user = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "Password1!", role: "volunteer")
    organization = Organization.create!(name: "Test Org")
    need = VolunteerNeed.create!(title: "Test Need", description: "Need description", organization: organization)
    assignment = VolunteerNeedAssignment.new(volunteer: user, need: need)

    assert assignment.valid?
  end

  test "should be invalid without a volunteer" do
    organization = Organization.create!(name: "Test Org")
    need = VolunteerNeed.create!(title: "Test Need", description: "Need description", organization: organization)
    assignment = VolunteerNeedAssignment.new(need: need)

    assert_not assignment.valid?
  end

  test "should be invalid without a need" do
    user = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "Password1!", role: "volunteer")
    assignment = VolunteerNeedAssignment.new(volunteer: user)

    assert_not assignment.valid?
  end
end