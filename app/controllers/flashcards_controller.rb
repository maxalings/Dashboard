class FlashcardsController < ApplicationController
  def create
    @flashcard = Flashcard.new(flaschard_params)
    @flashcard.widget = Widget.find(params[:widget_id])
    @flashcard.save
    redirect_to widgets_path
  end
    
  def destroy
    flashcard = Flashcard.find(params[:flashcard])
    flashcard.destroy
    redirect_to widget_flashcards_path, notice: "Flashcard deleted successfully."
  end

  private
  def flaschard_params
    params.require(:flashcard).permit(:question, :answer)
  end
end
