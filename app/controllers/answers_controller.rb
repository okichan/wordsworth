class AnswersController < ApplicationController
  def new
  end

  def create
    @question = Question.find(params[:question_id])
    SampleMailer.send_when_create(@question).deliver
    @question.answers.create(comment_params)
    redirect_to question_path(@question)
  end

  def edit
  end

  def update
  end

  private
  def comment_params
    params.require(:answer).permit(:text, :user_id)
  end
end
