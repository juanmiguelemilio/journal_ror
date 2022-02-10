class JournalsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.create(journal_params)

    if @journal.save
      redirect_to @journal
    else
      render :new
    end
  end

  def edit
  end

  private
  def journal_params
    params.require(:journal).permit(:title, :content)
  end

end
