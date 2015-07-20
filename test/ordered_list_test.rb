require 'minitest/autorun'
require 'minitest/pride'
require '../lib/Ordered_list'

class OrderedListTest < MiniTest::Test

  def test_it_adds_li_tags
    list = "1. chicken\n2. rice\n3. beans"
    li_tags = OrderedList.new(list)
    assert_equal "<li>chicken</li>\n<li>rice</li>\n<li>beans</li>\n",li_tags.add_li_tags
  end

  def test_it_adds_ol_tags
    list = "1. chicken\n2. rice"
    ol_tags = OrderedList.new(list)
    assert_equal "<ol>\n<li>chicken</li>\n<li>rice</li>\n</ol>\n\n", ol_tags.add_ol_tags
  end

  def test_it_adds_strong_and_em_tags
    list = "1. *chicken **and** rice*"
    all_tags = OrderedList.new(list)
    assert_equal "<ol>\n<li><em>chicken <strong>and</strong> rice</em></li>\n</ol>\n\n", all_tags.to_html
  end
end
