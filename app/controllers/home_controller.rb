class HomeController < ApplicationController
  def index
    @categories = Category.all
    @todo_lists = TodoList.all
    @categories = Category.all

    cat = params[:cat]
    if !cat.nil?
      @journals = Journal.where(:category_id => cat)
    else
      @journals = Journal.all
    end
  end

  def dashboard
  end
end
