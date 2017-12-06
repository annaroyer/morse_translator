require 'pry'
class Translator

  def morse_lookup
    alphabet = {}
    File.open('./data/morse_alphabet.txt', 'r').each do |line|
      characters = line.chomp.split(' ')
      alphabet[characters.first] = characters.last
    end
    alphabet
  end

  def eng_lookup
    alphabet = {}
    File.open('./data/morse_alphabet.txt', 'r').each do |line|
      characters = line.chomp.split(' ')
      alphabet[characters.last] = characters.first
    end
    alphabet
  end

  def translate(letters, dictionary)
    letters.map do |letter|
      if letter == ' '
        ' '
      else
        dictionary[letter]
      end
    end.join('')
  end

  def eng_to_morse(english)
    letters = english.upcase.chars
    translate(letters, morse_lookup)
  end

  def from_file(file)
    message = ''
    File.open(file, 'r').each do |line|
      message += eng_to_morse(line.chomp)
    end
    return message
  end

  def morse_to_eng(morse)
    words = morse.split('  ')
    words.map do |word|
      morse_letters = word.split(' ')
      translate(morse_letters, eng_lookup).downcase
    end.join(' ')
  end
end
binding.pry
