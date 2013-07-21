#!/usr/bin/env ruby

# 2013-07
# Jesse Cummins
# https://github.com/jessc


=begin
# bug list:
# todo:

=end

# Used to check if Qwantz image exists.
require 'open-uri'
require 'net/http'

Shoes.app :title => "Qwantz Viewer", :width => 852, :height => 639 do

  stack :margin => 20 do
    style(:margin_left => '50%', :left => '-25%')
    flow do

      # consider also showing the date of the comic,
      # eg, Jan 1, 2010
      para "Comic Number:"
      @comic_number_line = edit_line
      @comic_number_line.text = "11"

      button "Apply" do
        @image_url = "http://www.qwantz.com/comics/comic2-" + @comic_number_line.text + ".png"

        # bug:
        # need to add URL-valid-checking code to the Previous/Next buttons
        # If this URL not valid, show
        # a "No Image Available".jpg.
        url = URI.parse(@image_url)
        Net::HTTP.start(url.host, url.port) do |http|
          if http.head(url.request_uri).code == "404"
            @image_url = "https://lh4.googleusercontent.com/-iHcpcxQcoJ4/UWZNGLcFV2I/AAAAAAAACNE/uNyPZ5j31iY/s330/noImageAvailable.JPG"
          end
          # unless http.head(url.request_uri).code == "200"
          #   @image_url = "https://lh4.googleusercontent.com/-iHcpcxQcoJ4/UWZNGLcFV2I/AAAAAAAACNE/uNyPZ5j31iY/s330/noImageAvailable.JPG"
          # end
        end

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
      style(:margin_top => '20%', :margin_left => '32%', :left => '-25%')
      @comic = image "http://www.qwantz.com/comics/comic2-14.png"
    end

end

