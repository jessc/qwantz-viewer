#!/usr/bin/env ruby

# 2013-07
# Jesse Cummins
# https://github.com/jessc


=begin
# bug list:
# todo:

=end


Shoes.app :title => "Qwantz Viewer", :width => 852, :height => 639 do

  stack :margin => 20 do
    flow do
      para "Dinosaur Comics"
      @comic = image "http://www.qwantz.com/comics/comic2-14.png"
    end

    flow :margin => 20 do
      # refactor this code, it's so awful
      button "Previous" do
        image_num = @comic_number_line.text.to_i
        image_num -= 1
        @comic_number_line.text = image_num.to_s
        @image_url = "http://www.qwantz.com/comics/comic2-" + @comic_number_line.text + ".png"
        @comic.path = @image_url
      end
      button "Next" do
        image_num = @comic_number_line.text.to_i
        image_num += 1
        @comic_number_line.text = image_num.to_s
        @image_url = "http://www.qwantz.com/comics/comic2-" + @comic_number_line.text + ".png"
        @comic.path = @image_url
      end

      para "Comic Number:"
      @comic_number_line = edit_line
      @comic_number_line.text = "14"

      button "Apply" do
        @image_url = "http://www.qwantz.com/comics/comic2-" + @comic_number_line.text + ".png"
        # bug:
        # before changing, must detect that this is a valid URL
        # otherwise it will not show an image at all
        @comic.path = @image_url
      end
    end
  end
end

