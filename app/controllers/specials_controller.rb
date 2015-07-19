class SpecialsController < ApplicationController
  before_action :set_special, only: [:show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :edit, :destroy ]

  # GET /specials
  # GET /specials.json
  def index
    @specials = Special.all
  end

  # GET /specials/1
  # GET /specials/1.json
  def show
    @pages = Page.all
  end

  # GET /specials/new
  def new
    @special = Special.new
    @special.pages.build
  end

  # GET /specials/1/edit
  def edit
  end

  # POST /specials
  # POST /specials.json
  def create
    @special = Special.new(special_params)

    respond_to do |format|
      if @special.save
        flash[:success] = "Special Offers images were successfully uploaded."
        format.html { redirect_to @special }
        format.json { render :show, status: :created, location: @special }
      else
        format.html { render :new }
        format.json { render json: @special.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specials/1
  # PATCH/PUT /specials/1.json
  def update
    respond_to do |format|
      if @special.update(special_params)
        flash[:success] = "Special Offers images were successfully updated."

        format.html { redirect_to @special }
        format.json { render :show, status: :ok, location: @special }
      else
        format.html { render :edit }
        format.json { render json: @special.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specials/1
  # DELETE /specials/1.json
  def destroy
    @special.destroy
    respond_to do |format|
      format.html { redirect_to specials_url, notice: 'Special was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special
      @special = Special.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_params
      params.require(:special).permit(:title, :start_date, :end_date, pages_attributes: [:id, :image, :special_id])
    end

    def admin_user 
        redirect_to(home_path) unless current_user.admin?
    end
end