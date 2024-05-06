class UsersController < ApplicationController
  def index

    @list_of_users = User.all.order({ :username => :asc})

    render({ :template => "user_templates/index"})    
  end

  def show
    url_username = params.fetch("path_username")
    @the_user = User.where({ :username => url_username}).at(0)

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show"})
    end
  end

  def update
    #Parameters: {"input_username"=>"rafael", "past_username"=>"anisa"}

    old_username = params.fetch("past_username")
    new_username = params.fetch("input_username")

    new_user = User.where({ :username => old_username}).first
    new_user.username = new_username
    
    new_user.save

    redirect_to("/users")

  end

end
