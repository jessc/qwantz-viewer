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
      # displays comic, then changes the image to another using .path
      comic = image image_url
      comic.path = "http://www.qwantz.com/comics/comic2-120.png"
    end
  end
end

