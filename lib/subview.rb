

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

    def self.form(options={}) 
      puts options[:action]

      f = Form.new
      yield f

     puts f.render
    end


    def self.label(id) 
      # look up id in tree 
      #
      # take block of found dom element and assign html var
      l = Label.new  

      yield l 

      @command_control.register(l)
    end

    def self.ul(options={})
      # all controll variables have to be in the controller.variable 
      #
     # puts "find class #{options[:class]}" 

      # a collection
      # ul(':li => 'name'). each do 
    end

    def self.a(options={}) 
      # create command chain for later activation by builder

      a = Href.new

      #Command.new.push(options) 
    end


  end

end
