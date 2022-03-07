require 'json'
require 'open-uri'
require 'set'

class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def check_letter(args, args2)
    args.all? { |letter| args.count(letter) <= args2.count(letter) }
  end

  def score
    word = params[:suggestion]
    split = params[:suggestion].split('') #transform array
    pressence = params[:authenticity_letter].split #transform array
    @score = call_api(word) && check_letter(split, pressence) ? 10 : 0
  end

  private

  def call_api(word)
    response = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{word}").read)
    response['found']
  end

end
