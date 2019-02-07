class CommentController < ApplicationController
  
  protect_from_forgery with: :exception
  before_action :authenticate_user, only: [:new, :edit]
  def show
    @comment = Comment.find(params[:id])
  end
  def new
    @pos = Comment.new

  end

  def create
    @pos = Comment.new(content: params[:content],gossip_id: params[:gossip_id],user_id: session[:user_id])
    if @pos.save
      gossip = @pos.gossip_id
      redirect_to gossip_path(gossip)
    else
      render 'edit'
    end
  end

  def edit
    @pos = Comment.find( params[:id])
  end

  def update
    @pos = Comment.find( params[:id])
    if @pos.update( content: params[:content])
      flash[:note] = "Hey, ça y est. Tu as édités un commentaire."
      redirect_to gossip_path(@pos.gossip.id)
    else
      render 'edit'
    end
  end

  def destroy
    @destro = Comment.find(params[:id])
    @destro.destroy


    redirect_to gossip_path(params[:gossip_id])
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
