class GossipController < ApplicationController

  protect_from_forgery with: :exception

  def show
    @gossip_id = Gossip.find(params[:id])
  end

  def new
    @post = Gossip.new
  end

  def create

     @post = Gossip.new(title: params[:title],content: params[:content], user_id: params[:author].to_i)
    if @post.save
      flash[:success] = "Bravo, vous avez créé un potin"
      redirect_to '/home'
    else
      render 'new'
    end
  end

  def edit
    @up = Gossip.find(params[:id])
  end

  def update
    @up = Gossip.find(params[:id])
    if @up.update(title: params[:title], content: params[:content])
      flash[:notice] = "Hey, ça y est. Tu as édités un potin."
      redirect_to gossip_path(@up.id)
    else
      render 'edit'
    end
  end

  def destroy
    @destro = Gossip.find(params[:id])
    @destro.destroy


    redirect_to gossip_index_path
  end

end
