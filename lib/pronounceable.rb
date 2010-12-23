module Pronounceable
  @@vowels = ['a', 'e', 'i', 'o', 'u']

  def pronounceable?
    vowel_found     = false
    current_vowel   = nil
    prev_vowel      = nil
    prev_prev_vowel = nil
    prev_letter     = nil

    self.each_char do |char|
      if @@vowels.include?(char)
        vowel_found   = true
        current_vowel = true
      else
        current_vowel = false
      end
      return false if char == prev_letter unless char == 'e' or char == 'o'
      return false if prev_prev_vowel == prev_vowel and prev_vowel == current_vowel
      prev_prev_vowel = prev_vowel
      prev_vowel = current_vowel
      prev_letter = char
    end
    vowel_found and true
  end

end
