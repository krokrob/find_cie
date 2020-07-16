class GooglePlaceClient
  def initialize
    @api_key = Rails.application.credentials.google_place_api_key
    @find_api_base_url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?"
    @details_api_base_url = "https://maps.googleapis.com/maps/api/place/details/json?"
  end

  def find(query)
    url = "#{@find_api_base_url}input=#{query}&inputtype=textquery&fields=formatted_address,name,types,place_id&key=#{@api_key}"
    JSON.parse(HTTParty.get(url).body)
  end

  def details(place_id)
    url = "#{@details_api_base_url}place_id=#{place_id}&fields=name,formatted_phone_number&key=#{@api_key}"
    JSON.parse(HTTParty.get(url).body)
  end
end
