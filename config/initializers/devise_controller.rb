#based on http://stackoverflow.com/questions/15520151/rails-4-authentication
DeviseController.class_eval do
  def resource_params
    unless params[resource_name].blank?
      params.require(resource_name).permit(:email, :password, :password_confirmation, :remember_me)
    end
  end
end