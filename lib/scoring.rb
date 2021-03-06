require 'pry'

module Scrabble
  class Scoring

    LETTER_VALUES = {
      'a' => 1,
      'b' => 3,
      'c' => 3,
      'd' => 2,
      'e' => 1,
      'f' => 4,
      'g' => 2,
      'h' => 4,
      'i' => 1,
      'j' => 8,
      'k' => 5,
      'l' => 1,
      'm' => 3,
      'n' => 1,
      'o' => 1,
      'p' => 3,
      'q' => 10,
      'r' => 1,
      's' => 1,
      't' => 1,
      'u' => 1,
      'v' => 4,
      'w' => 4,
      'x' => 8,
      'y' => 4,
      'z' => 10
    }

    def self.score(word)
      raise ArgumentError.new "max word length is 7" if word.length > 7
      raise ArgumentError.new "use atleast one letter" if word.length == 0
      raise ArgumentError.new("input must be string") if word.class != String

      score = 0
      word.chars.each do |char|
        score += LETTER_VALUES[char.downcase]
      end
      score += 50 if word.length == 7
      return score
    end

    def self.tie(word, max_word)
      if ((word.length == 7) && (max_word.length != 7)) || ((word.length < max_word.length) && (max_word.length != 7))
        max_word = word
        return max_word.downcase
      else
        return max_word.downcase
      end
    end

    def self.highest_score_from(array_of_words)
      max_score = 0
      max_word = ""
      array_of_words.each do |word|
        if score(word) == max_score
          max_word = tie(word, max_word)
          max_score = score(max_word)
        elsif score(word) > max_score
          max_score = score(word)
          max_word = word
        end # if conditional
      end # do loop
      return max_word.downcase
    end # self.highest_score_from

  end #scoring
end #module
