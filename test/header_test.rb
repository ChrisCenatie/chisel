require 'minitest/autorun'
require 'minitest/pride'
require '../lib/header'

class HeaderTest2 < MiniTest::Test

  def test_it_determines_single_hashtag_count
    header = Header.new('# Header 1 tag')
    assert_equal 1, header.header_hashtag_count
  end

  def test_it_determines_multiple_hashtag_count
    header = Header.new('## Header 2 tag')
    assert_equal 2, header.header_hashtag_count
  end

  def test_it_does_not_count_hashtags_after_header
    header = Header.new("###### This # shouldn't be counted")
    assert_equal 6, header.header_hashtag_count
  end

  def test_it_removes_markdown_hashtags
    header = Header.new('### Header tags be gone')
    assert_equal "Header tags be gone", header.remove_hashtags
  end

  def test_converts_to_html_h1
    header = Header.new('# I like poptarts')
    assert_equal "<h1>I like poptarts</h1>\n\n", header.to_html
  end

  def test_converts_to_html_h2
    header = Header.new('## I like two poptarts')
    assert_equal "<h2>I like two poptarts</h2>\n\n", header.to_html
  end

  def test_converts_to_html_h3
    header = Header.new('### I like three poptarts')
    assert_equal "<h3>I like three poptarts</h3>\n\n", header.to_html
  end

  def test_converts_to_html_h4
    header = Header.new('#### I like four poptarts')
    assert_equal "<h4>I like four poptarts</h4>\n\n", header.to_html
  end

  def test_converts_to_html_h5
    header = Header.new('##### I like five poptarts')
    assert_equal "<h5>I like five poptarts</h5>\n\n", header.to_html
  end

  def test_converts_to_html_h6
    header = Header.new('###### I like six poptarts')
    assert_equal "<h6>I like six poptarts</h6>\n\n", header.to_html
  end

  def test_converts_to_html_h3_with_hashtags_after_header
    header = Header.new("### This # should be part of string")
    assert_equal "<h3>This # should be part of string</h3>\n\n", header.to_html
  end

  def test_it_adds_strong_and_em_tags
    header = Header.new('# *I **like** poptarts*')
    assert_equal "<h1><em>I <strong>like</strong> poptarts</em></h1>\n\n", header.to_html
  end

end
