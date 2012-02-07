class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:edit, :update, :index]
  before_filter :correct_user, :only => [:edit, :update]
  # verify_admin is called before destroy action
  before_filter :verify_admin, :only => [:destroy]
  before_filter :already_signed_in, :only => [:new, :create]

  def new
    @user = User.new
    @title = "Sign Up"
    @button_name = "Submit"
  end

  def show 
    @user = User.find(params[:id])
    @user_nil = @user.nil?
    @title = @user.name
    #@microposts = @user.microposts.paginate(:page => params[:page])
  end

  def index
    @allusers = User.all
    #@users = User.paginate(:page => params[:page])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome"
      sign_in @user
      redirect_to @user
    else
      @user.password = ""
      @user.password_confirmation = ""
      @title = "Sign Up Again"
      render 'new'
    end
  end

  def edit
    @title = "Edit"
    @button_name = "Update"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      flash[:error] = "Failed to Update. Try Again"
      @title = "Edit users"
      render 'edit'
    end
  end

  def destroy
     u_name = @c_user.name
     @c_user.destroy
    flash[:success] = "User #{u_name} has been deleted."
    redirect_to users_path
  end

  private

      #current_user? is defined in app/helpers/sessions_helper.rb
      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
      end

      def verify_admin
       @c_user = User.find(params[:id])
       if current_user == nil
          redirect_to signin_path
       else
         if !current_user.admin? 
          flash[:error] = "You are not authorized to delete users."
          redirect_to users_path
         else 
           if current_user == @c_user
             redirect_to root_path
           end
        end
       end
     end

     #This method for restricting signed in user from using 'new'
     #and create
     def already_signed_in
       if current_user != nil
         redirect_to(root_path)
       end
     end


end
