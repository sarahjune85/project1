class PagesController < ApplicationController
  before_action :check_for_login, :only => [:home] 

  def home  
    @boards = @current_user.boards.order(position: :asc)


    time = Time.new    
    if time.hour >= 7 && time.hour <= 10
      @greeting = "Rise and shine, #{@current_user.name}. 🌄"
    elsif time.hour >= 11 && time.hour <= 12
      @greeting = "Time for coffee #2, #{@current_user.name}. ☕"
    elsif time.hour >= 13 && time.hour <= 17
      @greeting = "Good afternoon, #{@current_user.name}. 🌇"
    elsif time.hour >= 18 && time.hour <= 23
      @greeting = "Good evening, #{@current_user.name}. 🌃"
    else 
      @greeting = "Sleep is very important, #{@current_user.name}... 🛌"    
    end 
  end

  def pinned  
    fetch_user    
    @snippets = @current_user.snippets.all
  end   
  
end
