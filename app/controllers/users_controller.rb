class UsersController < ApplicationController
   before_action :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
    else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end

   def downgrade
    current_user.update_attribute(:role, "standard")
   end
 
   private
 
   def user_params
     params.require(:user).permit(:name, :role)
  end
end 
