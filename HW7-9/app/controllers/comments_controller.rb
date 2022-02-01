class CommentsController < ApplicationController
  before_action :set_post
  after_action :edited1, only: %i[edit]

  def index
    @comments = Comment.published
    redirect_to post_path(@post, @comments)
  end

  def create
    @comment = @post.comments.build comment_params
    @comment.author_id = session[:author_id]
    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to post_path(@post)
    else
      @comments = Comment.order created_at: :desc
      render 'posts/show'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.published!
    redirect_to post_path(@comment.post)
  end

  def edited1
    @comment = Comment.find(params[:id])
    @comment.update(edited: @comment.edited += 1)
  end

  def show; end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def destroy
    comment = @post.comments.find params[:id]
    comment.destroy
    flash[:success] = 'Comment deleted!'
    redirect_to post_path(@post)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body, :status)
  end

  def vote_params
    params.require(:comment).permit(author_id: session[:author_id])
  end

  def set_post
    @post = Post.find params[:post_id]
  end
end
