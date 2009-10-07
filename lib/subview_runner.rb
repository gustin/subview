require 'rubygems'
require 'nokogiri'

##
# The View class is loaded and executed. 
#
# A block defines a selector, the method is called, 
# the options and selector is stored on a command object stack.
#
# The builder is the receiver of the chain of responsibility.
# It loads the html view, parses for the items in the chain of commands
# and replaces html with values. 
#
# Finally spits out html to render. 
##




class Builder

  def build
    builder = Nokogiri::HTML::Builder.new do |doc|
      doc.html {
        doc.head {
          doc.script {
            doc.text "alert('hello world');"
          }
          doc.style {
            doc.text "div#thing { background: red; }"
          }
          doc.title "Awesome Page" 
        }
        doc.body {
          doc.div.rad.thing! {
            doc.h1 "This is an h1"
            doc.text "This is a div with class 'rad' and id 'thing'"

            doc.div( :some_attribute => 'foo' ) {
              doc.p "This is an awesome paragraph!"
            }
          }
        }
      }
    end

    builder.to_html
  end


end

class Command 
  attr_accessor :receiver

  def initialize receiver
    @receiver = receiver
    @commands = []
  end

  def register_command *command
    @commands.push *command
  end

  def execute
    @commands.each { |cmd| cmd.render }
    render
  end

  # to be implemented in subclass
protected
  
  def render 
    
  end

end


class TextInput
  attr_accessor :text
  attr_accessor :text_id

end

class Form # < Command  
  attr_accessor :input

  def initialize 
    @input = TextInput.new
  end

  def render
    to_render = "<form>
      <input id=\"#{@input.text_id}\">#{@input.text}</input>
    </form>"
  end
end

class Href  

  def render
    "<a>#{@text}</a>"
  end
end

class Label

  attr_accessor :text 

  def render
    "<label>#{@text}</label>"
  end
end


  def books_path
    '/books'
  end

  def form(options={}) 
    puts options[:action]

    f = Form.new
    yield f

    puts f.render
  end


  def label(id) 
   # puts id
    # look up id in tree 
    #
    # take block of found dom element and assign html var
    l = Label.new  

    yield l 

   # puts l.render
  end

  def ul(options={})
    # all controll variables have to be in the controller.variable 
    #
   # puts "find class #{options[:class]}" 

    # a collection
    # ul(':li => 'name'). each do 
  end

  def a(options={}) 
    # create command chain for later activation by builder

    a = Href.new

    #Command.new.push(options) 
  end


class SubView

  def render
    Builder.new.build  
  end
end


class View < SubView

  a(:href => '/localhost') do |a|
    a.href = '/remotehost'
  end

  ul(:class => 'cusomer_list') do |ul| 
  
  end

  label :customer_name do |label| 
    label.text = 'John Doe' 

  end

  form(:action => books_path) do |form|
    form.input.text = 'booya'
    form.input.text_id = 'identify-me'
  end
end





