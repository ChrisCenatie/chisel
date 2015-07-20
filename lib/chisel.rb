require_relative 'parser'

input = ARGV[0]
output = ARGV[1]

md_file = File.read(input)
md_count = md_file.count("\n") + 1
md_to_html = Parser.new(md_file)
html = md_to_html.to_html
html_line_count = html.count("\n") + 1
html_file = File.open(output,"w")
html_file.write(html)
puts "Converted #{input} (#{md_count} lines) to #{output} (#{html_line_count} lines)"
