class Widgets::FlashcardsService
  attr_reader :flashcards, :widget

  def initialize(widget)
    @widget = widget
    @flashcards = @widget.flashcards
  end 

end
