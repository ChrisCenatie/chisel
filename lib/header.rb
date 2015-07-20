require_relative 'strong'
require_relative 'em'

class Header

  attr_accessor :line

  def initialize(line)
    @line = line
  end

  def to_html
    beginning_tag = "<h#{header_hashtag_count}>"
    ending_tag = "</h#{header_hashtag_count}>"
    add_h_tags ="#{beginning_tag}#{remove_hashtags}#{ending_tag}\n\n"
    add_s_tags = add_strong_tags(add_h_tags)
    add_em_tags = add_em_tags(add_s_tags)
  end

  def add_strong_tags(line)
    add_s_tags = Strong.new(line)
    add_s_tags.to_html
  end

  def add_em_tags(line)
    add_em_tags = Emphasis.new(line)
    add_em_tags.to_html
  end

  def header_hashtag_count
    parsed_line = line.split(' ')
    parsed_line[0].count('#')
  end

  def remove_hashtags
    (header_hashtag_count + 1).times{ line[0] = ""}
    line
  end
end
