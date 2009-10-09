class Builder

  def initialize(command_control)
    @command_control = command_control
  end

  def build
    puts 'Loading view.html...'
    html = File.new('lib/view.html', 'r')
    doc = Nokogiri::HTML(html)

    puts 'Processing...'
    @command_control.execute
  end

end


class Command 
  attr_accessor :receiver

  def initialize(receiver)
    @receiver = receiver
    @commands = []
  end

  def register(*command)
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

