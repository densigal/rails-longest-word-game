class GamesController < ApplicationController
  def new
    # used to display a new random grid and a form.
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    # form will be submitted (with POST) to the score action.
    # send get request to Dictionary API: found: true?
    require 'open-uri'
    @word = params[:word]
    @response = URI.open("https://dictionary.lewagon.com/#{@word}").read
    @data = JSON.parse(@response)
    p @data
    @validword = @data['found'] == true
    # iterate on word characters and compare each one with letters (present?)
    # @word.to_a.each do |letter|
    #   @letters.present? ?
  end
end
