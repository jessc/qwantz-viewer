#!/usr/bin/env ruby

# 2013-07
# Jesse Cummins
# https://github.com/jessc


=begin
# bug list:
# todo:

=end


Shoes.app :title => "Qwantz Viewer", :width => 800, :height => 600 do

  flow do
    para "Comic Number:"
    comic_number_line = edit_line
    comic_number_line.text = "1000"
    button "Apply" do
      image_url = "http://www.qwantz.com/comics/comic2-" + comic_number_line.text + ".png"
      comic = image image_url
      # comic.path = image_url
      # para comic.path
    end
  end
end

