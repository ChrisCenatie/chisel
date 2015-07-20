require 'minitest/autorun'
require 'minitest/pride'
require '../lib/parser'

class ParserTest < Minitest::Test

  def setup
    @header = "# Header"
    @paragraph = "This is a paragraph"
    @ordered_list = "1. This is an ordered list"
    @unordered_list = "* This is an unordered list"
  end

  def test_determines_line_is_an_unordered_list
    parser = Parser.new("Example")
    assert parser.unordered_list?(@unordered_list)
  end

  def test_determines_line_is_not_an_unordered_list
    parser = Parser.new("Example")
    refute parser.unordered_list?(@header)
    refute parser.unordered_list?(@paragraph)
    refute parser.unordered_list?(@ordered_list)
  end

  def test_determines_line_is_an_order_list
    parser = Parser.new("Example")
    assert parser.ordered_list?(@ordered_list)
  end

  def test_determines_line_is_not_an_ordered_list
    parser = Parser.new("Example")
    refute parser.ordered_list?(@header)
    refute parser.ordered_list?(@paragraph)
    refute parser.ordered_list?(@unordered_list)
  end

  def test_determines_line_is_a_paragraph
    parser = Parser.new("Example")
    assert parser.paragraph?(@paragraph)
  end

  def test_determines_line_is_not_a_paragraph
    parser = Parser.new("Example")
    refute parser.paragraph?(@header)
    refute parser.paragraph?(@ordered_list)
    refute parser.paragraph?(@unordered_list)
  end

  def test_determines_line_is_a_header
    parser = Parser.new("Example")
    assert parser.header?(@header)
  end

  def test_determines_line_is_not_a_header
    parser = Parser.new("Example")
    refute parser.header?(@paragraph)
    refute parser.header?(@unordered_list)
    refute parser.header?(@ordered_list)
  end

  def test_it_converts_paragraphs_headers_uls_ols_to_html
    skip
    md = "# header\n\nparagraph\n\n* ul\n\n1. ol"
    parser = Parser.new(md)
    assert_equal "<h1>header</h1>\n\n<p>\nparagraph\n</p>\n\n<ul>\n<li>ul</li>\n<ul>\n\n<ol>\n<li>ol</li>\n<ol>\n\n", parser.to_html
  end

end
