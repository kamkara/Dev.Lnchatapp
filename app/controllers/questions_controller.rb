class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: %i[ create new]
  before_action :set_question, only: %i[ index show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
    
  end

  # GET /questions/1 or /questions/1.json
  def show
    @questions = @course.questions.includes(:anwser).all_ordered
  end

  # GET /questions/new
  def new
    @question = @course.questions.build
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = @course.questions.build(question_params)
    @question.user_id = current_user.id
    respond_to do |format|
      if @question.save
        format.html { redirect_to question_path(@question), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.friendly.find(params[:id])
    end

    #Set course
    def set_course
      @course = Course.friendly.find(params[:course_id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :slug, :user_id, :course_id)
    end
end
