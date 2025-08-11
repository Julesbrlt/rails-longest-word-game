require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @letters.to_a.each do |letter|
      @letters.count(letter)
    if @word.include?(letter)
      @compare_letters = 'lalalalala'
    end
    end
    @word_exists = word_in_dictionary(@word)
    @compare_letters = word_in_letter(@word, @letters)
  end


  def word_in_dictionary(word)
    @url = "https://dictionary.lewagon.com/#{word}"
    @uri = URI.open(@url).read
    @new_uri = JSON.parse(@uri)
    if @new_uri['found']
      @score = "Congratulations #{word} is a valid english word"
    end
  end
end
