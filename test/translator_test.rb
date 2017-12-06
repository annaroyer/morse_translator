require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test
  def test_it_exists
    translator = Translator.new

    assert_instance_of Translator, translator
  end

  def test_it_translates_english_to_morse_code
    translator = Translator.new

    result = translator.eng_to_morse("hello world")
    expected = "......-...-..--- .-----.-..-..-.."

    assert_equal expected, result
  end

  def test_it_translates_english_to_morse_code_case_insensitive
    translator = Translator.new

    result1 = translator.eng_to_morse("Hello World")
    expected1 = "......-...-..--- .-----.-..-..-.."
    result2 = translator.eng_to_morse("There are 3 ships")
    expected2 = "-......-.. .-.-.. ...-- ..........--...."

    assert_equal expected1, result1
    assert_equal expected2, result2
  end

  def test_it_translates_english_text_from_a_file_to_morse_code
    translator = Translator.new

    result = translator.from_file("./data/input.txt")
    expected = ".. .--- ..-. .- ..-....-..."

    assert_equal expected, result
  end

  def test_it_translates_morse_code_to_english
    translator = Translator.new

    result = translator.morse_to_eng(".... . .-.. .-.. ---  .-- --- .-. .-.. -..")
    expected = "hello world"

    assert_equal expected, result
  end
end
