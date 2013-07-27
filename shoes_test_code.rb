

# Code to figure out Shoes rules to get
# variables across methods in a class work.


# From http://shoesrb.com/manual/Rules.html
# 1. Methods named "app" or which create new windows alter self to the App object.
# 2. Blocks attached to stacks, flows or any manipulation method (such as append) do not change self. Instead, they pop the slot on to the app's editing stack.

# Code from Shoes website:
class Messenger
  def initialize(stack)
    @stack = stack
    @x = edit_line
    button "add" do
      add(@x.text)
    end
  end
  def add(msg)
    @stack.app do
      @stack.append do
        para @x.text
        para msg
      end
    end
  end
end
Shoes.app do
  @messenger = Messenger.new(self)
end



# This is part of some code from another project
# that let you switch windows.
# (Not everything is here to do it.)
# How is it working? What are all the variables doing?
class ManyFileEditor
  def initialize(foobar)
    main_window(foobar)
  end
  def main_window(foobar)
    foobar.app do
      # button goes here?
      @main_window.hide
      @editing_window = self.editing_window(foobar)
      @editing_window.show
    end
  end
  def editing_window(foobar)
    f = nil
    foobar.app do
      f = flow do
        para "para"
      end
    end
    f
  end
end
Shoes.app do
  @many_file_editor = ManyFileEditor.new(self)
end





