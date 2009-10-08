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

