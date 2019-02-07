class UserController < ApplicationController
  def show
    @author = User.find(params["id"])
  end

  def new
    @user = ""
  end
  
  def create
    @user = User.new(email: params[:email], description: params[:description], first_name: params[:first_name], last_name: params[:last_name],age: params[:age].to_i, password: params[:password], city_id: params[:city], password_confirmation: params[:password_comfirmation])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if @user.save
      log_in(@user)
      redirect_to gossip_index_path
  
    else
      
      flash.now[:danger] = 'Invalid email/password combination'
      render "new"
      
    end
  end
end
