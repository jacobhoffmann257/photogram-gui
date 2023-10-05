class UsersController < ApplicationController
  def index
    matching_users = User.all()
    @list_of_users = matching_users.order({:username => :asc})
    render({:template => "users_templates/index"})
  end
  def show
  path_name = params.fetch("path_username")
  @current_user = User.where({username: path_name}).first
 # if the_user == nil
  #  redirect_to("/404", status:404)
  #else 
    render({template: "users_templates/show"})
  end
end
