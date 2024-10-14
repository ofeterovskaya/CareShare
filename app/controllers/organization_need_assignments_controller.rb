class OrganizationNeedAssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization_need_assignment, only: [:edit, :update, :destroy]

  def new
    @organization_need_assignment = OrganizationNeedAssignment.new
    @needs = [
      'Hygiene products',
      'Kitchenware',
      'Clothes',
      'Shoes',
      'Books',
      'Time',
      'Emotional support',
      'Carpool'
    ].map { |need| [need, need] }
  end

  def create
    @organization_need_assignment = current_user.organization_need_assignments.new(organization_need_assignment_params)
    if @organization_need_assignment.save
      redirect_to user_profile_path, notice: 'Essential need added successfully.'
    else
      @needs = [
        'Hygiene products',
        'Kitchenware',
        'Clothes',
        'Shoes',
        'Books',
        'Time',
        'Emotional support',
        'Carpool'
      ].map { |need| [need, need] }
      render :new
    end
  end

  def edit
    @needs = [
      'Hygiene products',
      'Kitchenware',
      'Clothes',
      'Shoes',
      'Books',
      'Time',
      'Emotional support',
      'Carpool'
    ].map { |need| [need, need] }
  end

  def update
    if @organization_need_assignment.update(organization_need_assignment_params)
      redirect_to user_profile_path, notice: 'Essential need updated successfully.'
    else
      @needs = [
        'Hygiene products',
        'Kitchenware',
        'Clothes',
        'Shoes',
        'Books',
        'Time',
        'Emotional support',
        'Carpool'
      ].map { |need| [need, need] }
      render :edit
    end
  end

  def destroy
    @organization_need_assignment.destroy
    redirect_to user_profile_path, notice: 'Essential need deleted successfully.'
  end

  private

  def set_organization_need_assignment
    @organization_need_assignment = OrganizationNeedAssignment.find(params[:id])
  end

  def organization_need_assignment_params
    params.require(:organization_need_assignment).permit(:need_id, :start_date)
  end
end