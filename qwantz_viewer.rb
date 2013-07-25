#!/usr/bin/env ruby

# 2013-07
# Jesse Cummins
# https://github.com/jessc


=begin
# bug list:
# todo:
# rewrite this as a class, then instantiate the class within Shoes.app

=end

# Used to check if Qwantz image exists.
require 'open-uri'
require 'net/http'

Shoes.app :title => "Qwantz Viewer", :width => 852, :height => 639 do

  stack :margin => 20 do
    style(:margin_left => '50%', :left => '-25%')
    flow do

      # bug:
      # consider also showing the date of the comic,
      # eg, Jan 1, 2010
      para "Comic Number:"
      @comic_number_line = edit_line
      @comic_number_line.text = "11"

      button "Apply" do
        @image_url = "http://www.qwantz.com/comics/comic2-" + @comic_number_line.text + ".png"

        # bug:
        # rewrite this as a method, then use it with Previous/Next buttons
        url = URI.parse(@image_url)
        Net::HTTP.start(url.host, url.port) do |http|
          if http.head(url.request_uri).code == "404"
            @image_url = "https://lh4.googleusercontent.com/-iHcpcxQcoJ4/UWZNGLcFV2I/AAAAAAAACNE/uNyPZ5j31iY/s330/noImageAvailable.JPG"
          end
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

        url = URI.parse(@image_url)
        Net::HTTP.start(url.host, url.port) do |http|
          if http.head(url.request_uri).code == "404"
            @image_url = "https://lh4.googleusercontent.com/-iHcpcxQcoJ4/UWZNGLcFV2I/AAAAAAAACNE/uNyPZ5j31iY/s330/noImageAvailable.JPG"
          end
        end

        @comic.path = @image_url
      end
      
      para "Dinosaur Comics"

      button "Next" do
        image_num = @comic_number_line.text.to_i
        image_num += 1
        @comic_number_line.text = image_num.to_s
        @image_url = "http://www.qwantz.com/comics/comic2-" + @comic_number_line.text + ".png"

        url = URI.parse(@image_url)
        Net::HTTP.start(url.host, url.port) do |http|
          if http.head(url.request_uri).code == "404"
            @image_url = "https://lh4.googleusercontent.com/-iHcpcxQcoJ4/UWZNGLcFV2I/AAAAAAAACNE/uNyPZ5j31iY/s330/noImageAvailable.JPG"
          end
        end

        @comic.path = @image_url
      end
    end
  end

  flow do
    style(:margin_top => '20%', :margin_left => '32%', :left => '-25%')
    @comic = image "http://www.qwantz.com/comics/comic2-14.png"
  end
end



class QwantzViewer
  def initialize(foobar)
    window(foobar)
  end

  def window(foobar)
    s = self
    foobar.app do

      @change = para "hopefully this will change"
      para "class version"

      stack :margin => 20 do
        style(:margin_left => '50%', :left => '-25%')

        flow do

          para "Comic Number:"
          @comic_number_line = edit_line
          @comic_number_line.text = "11"

          button "Apply" do
          end
        end

        flow :margin => 20 do
          # bug:
          # refactor to use methods
          button "Previous" do
          end

          para "Dinosaur Comics"

          button "Next" do
          end
        end
      end

      button "change_text" do
        variable_across_method
      end

      flow do
        style(:margin_top => '20%', :margin_left => '32%', :left => '-25%')
        @comic = image "http://www.qwantz.com/comics/comic2-14.png"
      end
    end
  end

  def variable_across_method
    @change.text = "changed!"
  end

  def set_image(image_url, comic, image_num, diff)
    @comic_number_line.text = "test of using variables across methods"
    
    # placeholder method
    # here will go the main code to switch comics,
    # for Apply, Previous, Next buttons

    image_num = @comic_number_line.text.to_i
    # this will be what diff affects
    # diff can be -1 or +1, to change the image
    image_num += diff

    @comic_number_line.text = image_num.to_s
    @image_url = "http://www.qwantz.com/comics/comic2-" + @comic_number_line.text + ".png"

    url = URI.parse(@image_url)
    Net::HTTP.start(url.host, url.port) do |http|
      if http.head(url.request_uri).code == "404"
        @image_url = "https://lh4.googleusercontent.com/-iHcpcxQcoJ4/UWZNGLcFV2I/AAAAAAAACNE/uNyPZ5j31iY/s330/noImageAvailable.JPG"
      end
    end
  end
end

# Un/comment =begin to de/activate the class version of the Shoes app.
=begin



Shoes.app :title => "Qwantz Viewer", :width => 852, :height => 639 do
  @qwantz_viewer = QwantzViewer.new(self)
end




=begin
# Put temporary code here.

=end


