class AnwsersController < ApplicationController 
  before_action :authenticate_user!,
                :set_course,
                :set_question
  before_action :set_anwser, only: %i[ show edit update destroy ]

  # GET /anwsers or /anwsers.json
  def index
    @anwsers = Anwser.all
  end

  # GET /anwsers/1 or /anwsers/1.json
  def show
  end

  # GET /anwsers/new
  def new
    @anwser = @question.anwsers.build
  end

  # GET /anwsers/1/edit
  def edit
  end

  # POST /anwsers or /anwsers.json
  def create
    @anwser = @question.anwsers.build(anwser_params)
    @anwser.user_id = current_user.id

    if @anwser.save
      respond_to do |format|
        format.html { redirect_to question_path(@question), notice: "Anwser was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Reponse Anvoyée..."}
      end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anwser.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /anwsers/1 or /anwsers/1.json
  def update
    respond_to do |format|
      if @anwser.update(anwser_params)
        format.html { redirect_to anwser_url(@anwser), notice: "Anwser was successfully updated." }
        format.json { render :show, status: :ok, location: @anwser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anwser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anwsers/1 or /anwsers/1.json
  def destroy
    @anwser.destroy

    respond_to do |format|
      format.html { redirect_to anwsers_url, notice: "Anwser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anwser
      @anwser = @question.anwsers.find(params[:id])
    end
    
    #Set course
    def set_course
      @course = Course.friendly.find(params[:course_id])
    end

    def set_question
      @question = @course.questions.friendly.find(params[:question_id])
    end
    
    # Only allow a list of trusted parameters through.
    def anwser_params
      params.require(:anwser).permit(:content, :question_id, :user_id)
    end
end
