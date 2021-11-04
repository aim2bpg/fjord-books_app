# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable, only: %i[create]
  def create
    super
    if @comment.save
      redirect_to [@commentable, @comments], notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      @book = Book.find(params[:book_id])
      render 'books/show'
    end
  end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
