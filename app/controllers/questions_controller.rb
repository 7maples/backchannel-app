class QuestionsController < ApplicationController
  before_filter :require_login

  def create
    question = QuestionFetcher.create_question(params.merge(user_id: current_user.id))
    if question
      render json: question, status: 201
    else
      render nothing: true, status: 404
    end
  end
end
