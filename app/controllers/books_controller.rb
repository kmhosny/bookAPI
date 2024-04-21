require 'vendors/open_library'
class BooksController < ApplicationController
  def show
    isbn = params[:isbn]
    if isbn.blank? || isbn.length != 13 && isbn.length != 10
      render json: { error: 'ISBN is required' }, status: :unprocessable_entity 
      return
    end
    book = Rails.cache.fetch(isbn, expires_in: 1.day) do
      Vendors::OpenLibrary.find(isbn)
    end

    return render json: { error: 'Book not found' }, status: :not_found if book.nil?
    
    render json: { title: book }
  end
end
