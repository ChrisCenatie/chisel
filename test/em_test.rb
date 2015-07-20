require 'minitest/autorun'
require 'minitest/pride'
require '../lib/em'

class EmphasisTest < Minitest::Test

  def test_it_adds_a_beginning_tag
    em = Emphasis.new("*Hello")
    assert_equal "<em>Hello", em.beginning_tag
  end

  def test_it_adds_an_ending_tag
    em = Emphasis.new("Goodbye*")
    assert_equal "Goodbye</em>", em.ending_tag
  end

  def test_it_converts_to_html
    em = Emphasis.new("Hello, *lots of emphasis*")
    assert_equal "Hello, <em>lots of emphasis</em>", em.to_html
  end

  def test_it_adds_em_tags_to_unordered_lists_and_strong
    em = Emphasis.new("<li>*my <strong>Favorite</strong> food*</li>\n")
    assert_equal "<li><em>my <strong>Favorite</strong> food</em></li>\n", em.to_html
  end

end
