#!/usr/bin/env ruby

# 2013-07
# Jesse Cummins
# https://github.com/jessc


=begin
# bug list:
# todo:


# Rewrite this as a class, then instantiate the class within Shoes.app.
# New note below:
# At the bottom is a class of QwantzViewer that should
# make it easier to DRY code, because very similar code
# can be abstracted into a method.
# Shoes doesn't seem to be powerful enough to do it, however.
# Since it's not, the code is here for reference of what
# doesn't seem to work. Hopefully some use for future
# people attempting to solve this Shoes issue.


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
        # (The point of figuring out this is to DRY code into methods.)
        # Doesn't work in Shoes:
        # variable_across_method
        # This doesn't change the text:
        # @change.text = variable_across_method
        # This changes the text to "", apparently:
        @change.text = @variable_across_method
        # This does, but defeats the purpose:
        # @change.text = "changed!"
      end

      flow do
        style(:margin_top => '20%', :margin_left => '32%', :left => '-25%')
        @comic = image "http://www.qwantz.com/comics/comic2-14.png"
      end
    end
  end

  def variable_across_method
    # (The point of figuring out this is to DRY code into methods.)
    # Doesn't work in Shoes:
    # @change.text = "changed!"
    "changed!"
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


=begin
# Un/comment =begin to de/activate the class version of the Shoes app.

# This is to easily use the class version.
Shoes.app :title => "Qwantz Viewer", :width => 852, :height => 639 do
  @qwantz_viewer = QwantzViewer.new(self)
end


=end
