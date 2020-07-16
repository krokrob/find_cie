class ShopsController < ApplicationController

  def index
    if params[:place_id]
      @place = GooglePlaceClient.new.details(params[:place_id])["result"]
    elsif params[:address] && params[:nature]
      query = "#{params[:nature]} in: #{params[:address]}"
      @places = GooglePlaceClient.new.find(query)['candidates']
    end
  end
end
