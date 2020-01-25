require 'test/unit'
require 'pry'
class MostCommonWord < Test::Unit::TestCase

  #https://leetcode.com/problems/most-common-word/submissions/
  # Qiita: https://qiita.com/ryujignh/items/a16251da41bcb28616a6

  def test_calc
    paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
    banned = ["hit"]
    output = "ball"
    assert_equal(output, solution(paragraph, banned))

    paragraph = "a, a, a, a, b,b,b,c, c"
    banned = ["a"]
    output = "b"
    assert_equal(output, solution(paragraph, banned))
  end

  def solution(paragraph, banned)
    # change the sentence to lowercase
    # remove , and .
    # iterate over each words, and count the number of same words
    # remove the banned output from the list
    # sort by the highest number
    # return the 1st element

    paragraph = paragraph.downcase
    paragraph = paragraph.gsub(',', ' ').gsub(',', ' ')
    words = paragraph.split(/\W+/)
    list = {}
    words.each do |word|
      #binding.pry
      if list[word]
        list[word] += 1
      else
        list[word] ||= 0
      end
    end
    list

    banned.each do |word|
      list.delete(word)
    end
    list = list.sort { |a, b| b[1] <=> a[1] }
    list.first[0]
  end

end
