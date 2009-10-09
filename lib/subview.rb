

module SubView

  class Base

    attr_accessor :command_control

    def initialize
      puts 'base'
      @command_control = Command.new(self) 
    end

    def render
      Builder.new(@command_control).build  
    end

    def form(options={}) 
      puts options[:action]

      f = Form.new
      yield f

     puts f.render
    end


    def label(id) 
      # look up id in tree 
      #
      # take block of found dom element and assign html var
      l = Label.new  

      yield l 

      puts l.render
      @command_control.register(l)
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


  end

end
