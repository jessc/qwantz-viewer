

# Code to figure out Shoes rules to get
# variables across methods in a class work.


# From http://shoesrb.com/manual/Rules.html
# 1. Methods named "app" or which create new windows alter self to the App object.
# 2. Blocks attached to stacks, flows or any manipulation method (such as append) do not change self. Instead, they pop the slot on to the app's editing stack.




class Messenger
 def initialize(stack)
   @stack = stack
 end
 
 def add(msg)
   @stack.app do
     @stack.append do
       para msg
     end
   end
 end
end



Shoes.app do
  @messenger = Messenger.new(self)
end

