require 'minitest/autorun'
require 'minitest/pride'
require '../lib/strong'

class StrongTest < MiniTest::Test

  def test_it_adds_a_beginning_tag
    strong = Strong.new("**Hello")
    assert_equal "<strong>Hello", strong.beginning_tag
  end

  def test_it_adds_an_ending_tag
    strong = Strong.new("Goodbye**")
    assert_equal "Goodbye</strong>", strong.ending_tag
  end

  def test_it_converts_to_html
    strong = Strong.new("Hello, **I am strong**")
    assert_equal "Hello, <strong>I am strong</strong>", strong.to_html
  end

  def test_it_ignores_lists_and_em_tags
    strong = Strong.new("* *my **Favorite** food*")
    assert_equal "* *my <strong>Favorite</strong> food*", strong.to_html
  end
end
