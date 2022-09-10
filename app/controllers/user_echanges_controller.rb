class UserEchangesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_course, only: %i[create, new]
  before_action :set_user_echange, only: %i[ show edit update destroy ]

  # GET /user_echanges or /user_echanges.json
  def index
    @user_echanges = UserEchange.all
  end

  # GET /user_echanges/1 or /user_echanges/1.json
  def show
    
  end

  # GET /user_echanges/new
  def new
    @user_echange = @course.user_echanges.build
  end

  # GET /user_echanges/1/edit
  def edit
  end

  # POST /user_echanges or /user_echanges.json
  def create
    @user_echange = @course.user_echanges.build(user_echange_params)
    @user_echange.user_id = current_user.id 
    
    respond_to do |format|
      if @user_echange.save
        format.html { redirect_to feed_path, notice: "User echange was successfully created." }
        format.json { render :show, status: :created, location: @user_echange }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_echange.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_echanges/1 or /user_echanges/1.json
  def update
    respond_to do |format|
      if @user_echange.update(user_echange_params)
        format.html { redirect_to user_echange_url(@user_echange), notice: "User echange was successfully updated." }
        format.json { render :show, status: :ok, location: @user_echange }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_echange.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_echanges/1 or /user_echanges/1.json
  def destroy
    @user_echange.destroy

    respond_to do |format|
      format.html { redirect_to user_echanges_url, notice: "User echange was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_echange
      @user_echange = UserEchange.friendly.find(params[:id])
    end

     #Find course
    def set_course
      @course = Course.friendly.find(params[:course_id])
    end

    # Only allow a list of trusted parameters through.
    def user_echange_params
      params.require(:user_echange).permit(:title, :content, :wiki, :status, :slug, :course_id, :user_id)
    end
end
