class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new
    username = params[:user][:username].downcase
    @user.username = username
    @user.email = params[:user][:email]
    if User.find_by(username: username)
      @errors = "Username already taken"
      render :new
    else
      @user.password = params[:user][:password]
      @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    end
  end

  def new
    @user = User.new

  end

  def index
    users = User.all
    @users = []
    users.each do |user|
      @users.push user #{:username => user.name, :score => user.score, :id => user.id}
    end
    @users.sort_by! {|user| user.points}
    @users.reverse!
  end
end
