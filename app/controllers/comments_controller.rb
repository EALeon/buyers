class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @purchase = Purchase.find(params[:comment][:commentable_id])
    @user_who_commented = current_user
    @comment = Comment.build_from(@purchase, @user_who_commented.id, params[:comment][:body] )

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @purchase}
        format.json { render :json => @purchase, :status => :created, :location => @purchase }
      end
    end
  end
end