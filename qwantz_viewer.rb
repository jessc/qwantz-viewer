#!/usr/bin/env ruby

# 2013-07
# Jesse Cummins
# https://github.com/jessc


=begin
# bug list:
# todo:

=end


Shoes.app :title => "Qwantz Viewer", :width => 900, :height => 675 do

  stack :margin => 20 do
    comic = image "http://www.qwantz.com/comics/comic2-14.png"

    flow :margin => 20 do
      para "Comic Number:"
      comic_number_line = edit_line
      comic_number_line.text = "14"

      button "Apply" do
        image_url = "http://www.qwantz.com/comics/comic2-" + comic_number_line.text + ".png"
        # bug:
        # before changing, must detect that this is a valid URL
        # otherwise it will not show an image at all
        comic.path = image_url
      end
    end
  end
end

