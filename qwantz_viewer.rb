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
    style(:margin_left => '50%', :left => '-25%')
    flow do

      para "Comic Number:"
      @comic_number_line = edit_line
      @comic_number_line.text = "11"

      button "Apply" do
        @image_url = "http://www.qwantz.com/comics/comic2-" + @comic_number_line.text + ".png"
        # bug:
        # before changing, must detect that this is a valid URL
        # otherwise it will not show an image at all. try:
        # uri = URI.parse(url)
        # result = Net::HTTP.start(uri.host, uri.port) { |http| http.get(uri.path) }
        # puts result.code
        # puts result.body

        @comic.path = @image_url
      end
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
      
      para "Dinosaur Comics"

      button "Next" do
        image_num = @comic_number_line.text.to_i
        image_num += 1
        @comic_number_line.text = image_num.to_s
        @image_url = "http://www.qwantz.com/comics/comic2-" + @comic_number_line.text + ".png"
        @comic.path = @image_url
      end
    end
  end
  flow do
    @comic = image "http://www.qwantz.com/comics/comic2-14.png"
  end
end

