module Pronounceable
  @@acceptable = /a|e|i|o|u/

  consecutive_letters = ('a'..'z').inject([]) do |array, letter|
    array << letter * 2
  end - ['ee', 'oo']
  consecutive_consonants = ('a'..'z').to_a.-(['a', 'e', 'i', 'o', 'u']).repeated_permutation(3).map(&:join)
  consecutive_vowels = ['a', 'e', 'i', 'o', 'u'].repeated_permutation(3).map(&:join)
  @@unacceptable = Regexp.new((consecutive_letters + consecutive_consonants + consecutive_vowels).join('|'))

  def pronounceable?
    !!self.match(@@acceptable) and
    !self.match(@@unacceptable)
  end

end
