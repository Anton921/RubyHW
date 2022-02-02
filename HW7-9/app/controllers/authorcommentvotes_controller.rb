class AuthorcommentvotesController < ApplicationController
  before_action :find_vote, only: [:destroy, :like_dislike]

  def like_dislike
    if voted?
      update_vote
    else
      create_vote
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
    Authorcommentvote.where(author_id: current_author.id, comment_id: vote_params[:comment_id]).exists?
  end

  def create_vote
    @vote = current_author.authorcommentvotes.build(vote_params)
    @vote.save
  end

  def update_vote
    if @vote[:status] == vote_params[:status]
      @vote.destroy
    else
      @vote.update(vote_params)
    end
  end

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

  def find_vote
    @vote = Authorcommentvote.find_by(author_id: current_author.id, comment_id:  vote_params[:comment_id])
  end

  def vote_params
    params.require(:authorcommentvote).permit(:comment_id, :status)
  end

end
