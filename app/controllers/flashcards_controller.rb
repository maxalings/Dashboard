class FlashcardsController < ApplicationController

  
  def create
    @flashcard = Flashcard
  end

  def new
    @flashcard = Flashcard.new
  end

  def create
    @flashcard = Flashcard.new(flaschard_params)
    @flashcard.save
    redirect_to widgets_path(current_user)
      
  end
    
    private
    def flaschard_params
      params.require(:flashcard).permit(:question, :answer)
    end
end
