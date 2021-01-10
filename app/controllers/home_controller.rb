class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = "https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=0&API_KEY=03019329-1CAC-4BA1-B13D-B32795DE30AA"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    # Check for empty return result
    if @output.empty?
      @final_output = "Error"
    elsif !@output  
      @final_output = "Error"
    else   
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Error"
      @api_colour = "grey"
    elsif @final_output < 51
      @api_colour = "green"
    elsif @final_output < 101
      @api_colour = "yellow"
    elsif @final_output < 151
      @api_colour = "orange"
    elsif @final_output < 201
      @api_colour = "red"
    elsif @final_output < 301
      @api_colour = "purple"
    elsif @final_output < 501
      @api_colour = "maroon"
    end
  end

  def zipcode
    @zip_query = params[:zipcode]

    if params[:zipcode] == ""
      @zip_query = "You forgot to enter a zip code"
    elsif params[:zipcode]
      require 'net/http'
      require 'json'
  
      @url = "https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=#{@zip_query}&distance=0&API_KEY=03019329-1CAC-4BA1-B13D-B32795DE30AA"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)
  
      # Check for empty return result
      if @output.empty?
        @final_output = "Error"
      elsif !@output  
        @final_output = "Error"
      else   
        @final_output = @output[0]['AQI']
      end
  
      if @final_output == "Error"
        @api_colour = "grey"
      elsif @final_output < 51
        @api_colour = "green"
      elsif @final_output < 101
        @api_colour = "yellow"
      elsif @final_output < 151
        @api_colour = "orange"
      elsif @final_output < 201
        @api_colour = "red"
      elsif @final_output < 301
        @api_colour = "purple"
      elsif @final_output < 501
        @api_colour = "maroon"
      end
    end
  end
end
