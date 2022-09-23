class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vote, only: %i[ show ]


  def show
    @question = Question.find(params[:question_id])
    @vote = Vote.find_or_create_by(user: current_user, question: @question)

    case params[:choice]
    when 'up_vote'
      @vote.up_vote? ? @vote.cancel! : @vote.up_vote!
    when 'down_vote'
      @vote.down_vote? ? @vote.cancel! : @vote.down_vote!
    end
  end

end
