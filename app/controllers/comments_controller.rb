# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show destroy]
  before_action :check_user, only: %i[destroy]

  # GET /reports/1/comments
  # reportsと同じようにbooksをルーティングに追加すれば、
  # GET /books/1/commentsも可能になります。
  def index
    @comments = @commentable.comments
  end

  # GET /reports/1/comments/1
  def show; end

  # GET /reports/1/comments/new
  def new
    @comment = @commentable.comments.build
  end

  # GET /reports/1/comments/1/edit
  def edit; end

  # POST /reports/1/comments
  def create
    @comment = @commentable.comments.build(comment_params)
  end

  # PATCH/PUT /reports/1/comments/1
  def update; end

  # DELETE /reports/1/comments/1
  def destroy
    @comment.destroy
    flash[:notice] = t('controllers.common.notice_destroy', name: Comment.model_name.human)
    redirect_back(fallback_location: root_path)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end

  def check_user
    redirect_back(fallback_location: root_path) if @comment.user_id != current_user.id
  end
end
