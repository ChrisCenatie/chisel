require_relative 'header'
require_relative 'paragraph'
require_relative 'unordered_list'
require_relative 'ordered_list'

class Parser

  def initialize(lines)
    @lines = lines.split("\n\n")
  end

  def to_html
    md_to_html = @lines.map do |line|
      if paragraph?(line)
        paragraph_to_html(line)
      elsif header?(line)
        header_to_html(line)
      elsif unordered_list?(line)
        unordered_list_to_html(line)
      else
        ordered_list_to_html(line)
      end
    end
    md_to_html.join
  end

  def paragraph_to_html(line)
    md_to_html = Paragraph.new(line)
    md_to_html.to_html
  end

  def header_to_html(line)
    md_to_html = Header.new(line)
    md_to_html.to_html
  end

  def unordered_list_to_html(line)
    md_to_html = UnorderedList.new(line)
    md_to_html.to_html
  end

  def ordered_list_to_html(line)
    md_to_html = OrderedList.new(line)
    md_to_html.to_html
  end

  def header?(line)
    if line.start_with?("#")
      true
    else
      false
    end
  end

  def unordered_list?(line)
    if line.start_with?("* ")
      true
    else
      false
    end
  end

  def ordered_list?(line)
    ordered_list = false
    (0..9).to_a.map do |number|
      if line.start_with?(number.to_s)
        return ordered_list = true
      end
    end
    ordered_list
  end

  def paragraph?(line)
   if ordered_list?(line) || unordered_list?(line) || header?(line)
    false
   else
     true
   end
  end
end
