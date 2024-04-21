class BooksController < ApplicationController
  def show
    isbn = params[:isbn]
    if isbn.blank? || isbn.length != 13 || isbn.length != 10
      render json: { error: 'ISBN is required' }, status: :unprocessable_entity 
      return
    end
    book = OpenLibrary.find(isbn)
    return render json: { error: 'Book not found' }, status: :not_found if book.nil?
    
    render json: { title: book }
  end
end
