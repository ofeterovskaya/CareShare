class OrganizationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_organization, only: %i[ show edit update destroy ]
  before_action :authorize_user!, only: [:edit, :update, :destroy] # restrict access to edit, update, and destroy actions

  # GET /organizations or /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1 or /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    @needs = Need.where(organization_id: @organization.id)
  end

  # GET /organizations/1/edit
  def edit
    @needs = Need.where(organization_id: @organization.id)
  end

  # POST /organizations or /organizations.json
  def create
    @organization = Organization.new(organization_params)
    @organization.user = current_user # connect the user to the organization
  
    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: "Organization was successfully created." }
        format.json { render :show, status: :created, location: @organization }
      else
        @needs = Need.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1 or /organizations/1.json
  def update
    filtered_params = organization_params 
      if filtered_params[:need_ids] 
        filtered_params[:need_ids].reject!(&:blank?) 
    end
      if @organization.update(organization_params)       
        # format.html { redirect_to @organization, notice: "Organization was successfully updated." }
        # format.json { render :show, status: :ok, location: @organization }
        redirect_to @organization
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
   
  end

  # DELETE /organizations/1 or /organizations/1.json
  def destroy
    @organization.destroy!

    respond_to do |format|
      format.html { redirect_to organizations_path, status: :see_other, notice: "Organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:name, :description, :contact_email, :location, need_ids: [])
    end

    def authorize_user!
      unless @organization.user == current_user
        redirect_to organizations_path, alert: "You are not authorized to modify this organization."
      end
    end
end