module Vendors
  class BookSearchBase
    def self.find(isbn)
      raise NotImplementedError
    end
  end
end