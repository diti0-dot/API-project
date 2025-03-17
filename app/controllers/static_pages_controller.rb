require 'httparty'

class StaticPagesController < ApplicationController
  def home
    if params[:query].present?
      url = "https://api.pexels.com/v1/search?query=#{params[:query]}&per_page=10"
      response = HTTParty.get(url, headers: { "Authorization" => "idahxPy1LlxdUMH3zvTJnAxcqELy5z5aqn2b4zHgi3zBeaPAZm0aTKBQ" })
      @photos = response.parsed_response["photos"] if response.success?
    end
  end
end
