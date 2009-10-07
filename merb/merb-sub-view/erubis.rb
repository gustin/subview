  require 'erubis'

  class Erubis    
    # ==== Parameters
    # io<#path>:: An IO containing the full path of the template.
    # name<String>:: The name of the method that will be created.
    # locals<Array[Symbol]>:: A list of locals to assign from the args passed into the compiled template.
    # mod<Module>:: The module that the compiled method will be placed into.
    #
    # :api: private
    def self.compile_template(io, name, locals, mod)
      template = ::Erubis::BlockAwareEruby.new(io.read)
      _old_verbose, $VERBOSE = $VERBOSE, nil
      assigns = locals.inject([]) do |assigns, local|
        assigns << "#{local} = _locals[#{local.inspect}]"
      end.join(";")
      
      code = "def #{name}(_locals={}); #{assigns}; #{template.src}; end"
      mod.module_eval code, File.expand_path(io.path)
      $VERBOSE = _old_verbose
      
      name
    end

    module Mixin
      
      # ==== Parameters
      # *args:: Arguments to pass to the block.
      # &block:: The template block to call.
      #
      # ==== Returns
      # String:: The output of the block.
      #
      # ==== Examples
      # Capture being used in a .html.erb page:
      # 
      #   <% @foo = capture do %>
      #     <p>Some Foo content!</p> 
      #   <% end %>
      #
      # :api: private
      def capture_erb(*args, &block)
        _old_buf, @_erb_buf = @_erb_buf, ""
        block.call(*args)
        ret = @_erb_buf
        @_erb_buf = _old_buf
        ret
      end

      # :api: private
      def concat_erb(string, binding)
        @_erb_buf << string
      end
            
    end
  
    Merb::Template.register_extensions(self, %w[erb])    
  end
  
end

module Erubis
  module BlockAwareEnhancer
    # :api: private
    def add_preamble(src)
      src << "_old_buf, @_erb_buf = @_erb_buf, ''; "
      src << "@_engine = 'erb'; "
    end

    # :api: private
    def add_postamble(src)
      src << "\n" unless src[-1] == ?\n      
      src << "_ret = @_erb_buf; @_erb_buf = _old_buf; _ret.to_s;\n"
    end

    # :api: private
    def add_text(src, text)
      src << " @_erb_buf.concat('" << escape_text(text) << "'); "
    end

    # :api: private
    def add_expr_escaped(src, code)
      src << ' @_erb_buf.concat(' << escaped_expr(code) << ');'
    end
    
    # :api: private
    def add_stmt2(src, code, tailch)
      src << code
      src << " ).to_s; " if tailch == "="
      src << ';' unless code[-1] == ?\n
    end
    
    # :api: private
    def add_expr_literal(src, code)
      if code =~ /(do|\{)(\s*\|[^|]*\|)?\s*\Z/
        src << ' @_erb_buf.concat( ' << code << "; "
      else
        src << ' @_erb_buf.concat((' << code << ').to_s);'
      end
    end
  end

  class BlockAwareEruby < Eruby
    include BlockAwareEnhancer
  end
  
  # module RubyEvaluator
  # 
  #   # DOC
  #   def def_method(object, method_name, filename=nil)
  #     m = object.is_a?(Module) ? :module_eval : :instance_eval
  #     setup = "@_engine = 'erb'"
  #     object.__send__(m, "def #{method_name}(locals={}); #{setup}; #{@src}; end", filename || @filename || '(erubis)')
  #   end
  #  
  # end
end
