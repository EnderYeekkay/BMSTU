# frozen_string_literal: false

# Main Class
class Words
  attr_accessor :content

  def initialize(arg)
    @content = arg
  end

  def add_words(arg)
    arg.each do |value|
      @content.push(value)
    end
  end

  def multiply
    @content.each do |word|
      ending = 'ата' if hissing(word[word.length - 5])
      ending = 'ята' unless hissing(word[word.length - 5])
      word.sub!('онок', ending)
      word.sub!('енок', ending)
      word.sub!('ёнок', ending)
    end
  end

  def hissing(arg)
    (arg.include? 'ш') || (arg.include? 'щ') || (arg.include? 'х') || (arg.include? 'ч')
  end
end

scp = Words.new %w[
  цыпленок
  утенок
  совенок
]
scp.add_words %w[
  дебиленок
  мышонок
]
scp.add_words %w[
  дебиленок
]
scp.multiply
puts scp.content
