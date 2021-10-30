# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create]
  def create
    super
    if @comment.save
      redirect_to [@commentable, @comments], notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      @report = Report.find(params[:report_id])
      render 'reports/show'
    end
  end

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
