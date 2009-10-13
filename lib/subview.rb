

module SubView

  class Base
    include Selectors

    attr_accessor :command_control

    def initialize
      puts 'base'
      @command_control = Command.new(self) 
    end

    ##
    # Loads a partial into the inner html of the passed selector. 
    # Fails quietly if the selector is not found, but cries about the partial missing.
    #
    # @param[Selector] selector A selector to define the partial to replace the inner html with.
    # @param[String] filename The name of the partial to load.
    # @param[Hash] options A hash of options to pass to the partial.
    def load_partial(selector, filename, options = {}) 
      "Loading #{filename}....."
    end


    ##
    # Specifies the layout that the view output should yield into.
    # Works just like erb layouts, only cleaner. 
    #
    # A selector is used to mark the including layout. 
    def layout(filename)

    end

    def render
      Builder.new(@command_control).build  
    end


  end

end
