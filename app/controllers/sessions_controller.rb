class SessionsController < ApplicationController

  def new
    @user = ""
  end
  
  def create
    @user = User.find_by(email: params[:email])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to gossip_index_path
  
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to gossip_index_path
  end

end
