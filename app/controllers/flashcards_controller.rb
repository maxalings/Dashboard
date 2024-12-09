class FlashcardsController < ApplicationController
  
  def create
    @flashcard = Flashcard

  end

  def new
    @flashcard = Flashcard.new
    @widget = Widget.find(params[:widget_id])

  end

end