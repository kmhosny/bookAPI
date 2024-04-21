module Vendors
  class BookSearchService
    def self.find(isbn)
      client.find(isbn)
    end

    def self.client
      case Rails.application.config.book_search_service
      when :open_library
        Vendors::OpenLibraryWrapper
      else
        raise 'Unknown book search service'
      end
    end
  end
end