def Index 
  include SubView

  def initialize
    self.h1 = 
    $('#h1'). 
    @address = Address.find(:first)
  end
  
  
  def click_h1
    
  end
  
  # rack routes parameters (like merb formal dynamic parameters!!)
  def push name='create'
    
  end

  div :some_div do |d|
    d.inner_html = 'blah-blah' 
    $('label').text = 'test'
  end

  div '#some_div .ul' do |d|

  end

  table :order_table do |t|
    orders = DeliveryOrders.find(:all)
    t.partial = render_partial 'orders', :data => orders
  end

  form :some_form do |f|
    customer = current_customer
    f.action = new_customer_path
    f.name = current_customer.first_name
    f.email = current_customer.email
  end

  label :first_name do |l|
    l.text = 'yo'
  end
  
  event :selector, :event => :onMouseOut, :call => 'javaScript' do |e|
    addresses = Address.find(:all)
  end
 
  event :some_form, :event => :onSubmit do
    # a no-no go to RESTful controllers
  end

end


# jQuery plugin (works with prototype)

