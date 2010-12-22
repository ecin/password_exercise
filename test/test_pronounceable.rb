require 'test_helper'
require 'pronounceable'

class String; include Pronounceable; end
class TestPronounceable < Test::Unit::TestCase

  context '#pronounceable?' do
    setup do
      @good_words = %w(a eep houctuh)
      @bad_words = %w(tv ptoui bontres zoggax wiinq)
    end

    should 'check good words as pronounceable' do
      @good_words.each do |word|
        assert word.pronounceable?, "#{word} should be pronounceable"
      end
    end

    should 'check bad words as not pronounceable' do
      @bad_words.each do |word|
        assert !word.pronounceable?, "#{word} should not be pronounceable"
      end
    end
  end

  context 'large input file' do
    setup do
      @input = File.open "#{File.dirname(__FILE__)}/say.in"
      @expected_output = File.open "#{File.dirname(__FILE__)}/say.out"
    end
    should 'produce expected large output file' do
      results = ''
      @input.each_line do |word|
        word = word.chomp
        results += "<#{word}> #{word.pronounceable? ? 'is' : 'is not'} acceptable.\n"
      end
      assert_equal results, @expected_output.read
    end
  end
end
