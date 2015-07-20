require 'minitest/autorun'
require 'minitest/pride'
require '../lib/paragraph'

class ParagraphTest < MiniTest::Test

  def test_it_adds_p_tags
    md_paragraph = "This is a paragraph"
    md_to_html = Paragraph.new(md_paragraph)
    assert "<p>\nThis is a paragraph\n</p>\n\n", md_to_html.to_html
  end

  def test_it_adds_p_tags_and_strong_tags
    md_paragraph = "This **is** a paragraph"
    md_to_html = Paragraph.new(md_paragraph)
    assert "<p>\nThis <strong>is</strong> a paragraph\n</p>\n\n", md_to_html.to_html
  end

  def test_it_adds_p_tags_and_em_tags
    md_paragraph = "This *is* a paragraph"
    md_to_html = Paragraph.new(md_paragraph)
    assert "<p>\nThis <em>is</em> a paragraph\n</p>\n\n", md_to_html.to_html
  end

  def test_it_adds_p_tags_strong_tags_and_em_tags
    md_paragraph = "This *is **a** paragraph*"
    md_to_html = Paragraph.new(md_paragraph)
    assert "<p>\nThis <em>is <strong>a</strong> paragraph</em>\n</p>\n\n", md_to_html.to_html
  end


end
