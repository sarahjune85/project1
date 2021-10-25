class PagesController < ApplicationController
  # before_action check_for_login, :only => [:home] 
  def home
  end

  def pinned  
    fetch_user
    @snippets = @current_user.snippets.all    

  end  

  
end
