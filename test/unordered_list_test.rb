require 'minitest/autorun'
require 'minitest/pride'
require '../lib/unordered_list'

class UnorderedListTest < MiniTest::Test

  def test_it_adds_li_tags
    list = "* chicken\n* rice\n* beans"
    li_tags = UnorderedList.new(list)
    assert_equal "<li>chicken</li>\n<li>rice</li>\n<li>beans</li>\n",li_tags.add_li_tags
  end

  def test_it_adds_ul_tags
    list = "* chicken\n* rice"
    ul_tags = UnorderedList.new(list)
    assert_equal "<ul>\n<li>chicken</li>\n<li>rice</li>\n</ul>\n\n", ul_tags.add_ul_tags
  end

  def test_it_adds_strong_and_em_tags
    list = "* *chicken **and** rice*"
    all_tags = UnorderedList.new(list)
    assert_equal "<ul>\n<li><em>chicken <strong>and</strong> rice</em></li>\n</ul>\n\n", all_tags.to_html
  end
end
