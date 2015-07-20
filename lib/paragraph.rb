require_relative 'strong'
require_relative 'em'

class Paragraph

  def initialize(md_line)
    @markdown_line = md_line
  end

  def to_html
    add_p_tags = "<p>\n#{@markdown_line}\n</p>\n\n"
    add_s_tags = add_strong_tags(add_p_tags)
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
end
