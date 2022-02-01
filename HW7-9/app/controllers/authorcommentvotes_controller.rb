class AuthorcommentvotesController < ApplicationController
  before_action :find_comment
  before_action :find_vote, only: [:destroy]
    
  def like
    if !voted?
      @comment.authorcommentvotes.liked.create(author_id: current_author.id)
    end
    respond_to do |format|
      format.js
    end
  end

  def dislike
    if !voted?
      @comment.authorcommentvotes.disliked.create(author_id: current_author.id)
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if voted?
      @vote.destroy
    end
  end

  private

  def voted?
    Authorcommentvote.where(author_id: current_author.id, comment_id: params[:comment_id]).exists?
  end

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

  def find_vote
    @vote = @comment.authorcommentvotes.find(params[:id])
  end

end
