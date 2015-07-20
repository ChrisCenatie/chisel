class Strong

  attr_accessor :line

  def initialize(line)
    @line = line
  end

  def beginning_tag
    line.sub!("**","<strong>")
  end

  def ending_tag
    line.sub!("**","</strong>")
  end

  def to_html
    while line.include?("**")
      beginning_tag
      ending_tag
    end
    line
  end
end
