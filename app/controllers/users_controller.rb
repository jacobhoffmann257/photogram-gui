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
  def add
  username = params.fetch("input_username")
  new_user = User.new
  new_user.username = username
  new_user.save
  redirect_to("/users/"+new_user.username)
  end
  def update
  username = params.fetch("new_username")
  old_name= params.fetch("old_name")
  the_user =User.where(username: old_name).first
  the_user.username = username
  the_user.save
  redirect_to("/users/"+the_user.username)
  end
end
