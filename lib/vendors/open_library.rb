require 'httparty'

module Vendors
  class OpenLibrary
    def self.find(isbn)
      url = "https://openlibrary.org/isbn/#{isbn}"
      response = HTTParty.get(url, {
        headers: {"Accept" => "application/json"}
      })
      return nil if response.code != 200
      data = JSON.parse(response.body)
      data["title"]
    end
  end
end