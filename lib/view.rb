

def books_path
  '/books'
end

#
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
class View < SubView::Base

  a(:href => '/localhost') do |a|
    a.href = '/remotehost'
  end

#  div(:class => "items") do 
    ul(:id => 'cusomer_list') do |ul| 
        
    end

    li(:id => 'product') do |li|
      
    end
#  end

  label :customer_name do |label| 
    label.text = 'John Doe' 
  end

  form(:action => books_path) do |form|
    form.input.text = 'booya'
    form.input.text_id = 'identify-me'
  end

#  css('h3.r a.l') do 
#
#  end

#  xpath('//h3/a[@class="l"]') do
#
#  end
end




