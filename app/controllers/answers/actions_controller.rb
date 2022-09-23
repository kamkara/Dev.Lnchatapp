module Answers
  class ActionsController < ApplicationController
    def show
      @question = Question.friendly.find(params[:question_id])
      @answer = @question.answers.find(params[:answer_id])
    end
  end
end