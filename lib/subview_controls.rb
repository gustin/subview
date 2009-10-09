
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
