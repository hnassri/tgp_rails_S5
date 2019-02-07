class CommentController < ApplicationController
  
  protect_from_forgery with: :exception

  def show
    @comment = Comment.find(params[:id])
  end
  def new
    @po = Comment.new
  end

  def create
    @po = Comment.new(content: params[:content],gossip_id: params[:gossip_id],user_id: 11)
    if @po.save
      gossip = @po.gossip_id
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
end
