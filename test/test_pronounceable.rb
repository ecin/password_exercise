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
        assert word.pronounceable?
      end
    end

    should 'check bad words as not pronounceable' do
      @bad_words.each do |word|
        assert !word.pronounceable?
      end
    end

  end
end
