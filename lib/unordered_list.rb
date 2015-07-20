require_relative 'strong'
require_relative 'em'

class UnorderedList

  def initialize(line)
    @list = line.split("\n* ")
  end

  def to_html
    unordered_tags = add_ul_tags
    add_s_tags = add_strong_tags(unordered_tags)
    add_em_tags = add_em_tags(add_s_tags)
  end

  def add_li_tags
    @list[0].sub!("* ","")
    li_tags = @list.map{|item| "<li>#{item}</li>\n"}
    li_tags.join
  end

  def add_ul_tags
    "<ul>\n#{add_li_tags}</ul>\n\n"
  end

  def add_strong_tags(line)
    add_s_tags = Strong.new(line)
    add_s_tags.to_html
  end

  def add_em_tags(line)
    add_em_tags = Emphasis.new(line)
    add_em_tags.to_html
  end

end
