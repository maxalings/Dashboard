class Widgets::FlashcardsService
  attr_reader :flashcards

  def initialize(widget)
    @widget = widget
    @flashcards = @widget.flashcards
  end 
  
  

end
