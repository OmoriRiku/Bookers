class BooksearchesController < ApplicationController
  def book_search
    @word = params[:word]
    @result = Book.where("title like ? ", "%#{@word}%")
  end
end
