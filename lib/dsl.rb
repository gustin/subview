

class View < SubView
  layout 'application'

  div(:id => 'flip') do |div|

    div.ul(:first) do |ul|
      ul = load_partial(:partial)
    end

  end


end
