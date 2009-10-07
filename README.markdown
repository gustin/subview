# subView

A next-gen template engine -- cause mixing ruby code and semantic html (via erb) SUCKS!!

erb was created in 1999, a 20th century technology.

Ruby Template Framework for the 21st Century!

## Philosophy

To keep html clean, simple, semantic, and separated from Ruby logic. The community focuses so much on separating styles from html; javascript from html, then we stick a patch of logic poo, with Ruby, right in the html.

We are reducing cohesion through removing dependecy on locality, see Jim Weircach's talk:
[The Building Blocks of Modularity]("http://mwrc2009.confreaks.com/14-mar-2009-18-10-the-building-blocks-of-modularity-jim-weirich.html")


## Coopetition

There really is no other solution, in Ruby that follows through with this concept. Asp.net has a similiar concept with code behind pages, but is convoluted with a complex page callback cycle and squirlly callbacks, too complex. 

Java and PHP have similiar ideas:
- some examples

This does not compete with Haml at all, is actually complimentary and can help clean up Haml files. 
Can work in tandem with Erb!

index.erb.html
index.rb


## Existing Ruby Template Engines

- [Kwartz]("http://www.kuwata-lab.com/kwartz") - Erb Version II, write concept, implementation is horrible
- [Erector]("http://github.com/pivotal/erector/") - Pivotal Builder Crap
- [Punk]("http://rubyforge.org/frs/?group_id=2320&release_id=7224") - Initializing but adds tags to html
- [19 Ruby Template Engines]("http://www.hokstad.com/mini-reviews-of-19-ruby-template-engines.html")


## Organization

A ruby file compliments an html file.
This could reside in the same directory or a separte /subview directory.

<pre><code>
/products
   index.html
   index.rb
   new.html
   new.rb
   _fresh_jive.html
   _fresh_jive.rb
</code></pre>

<pre><code>
/products
  /subview
     index.rb
     new.rb
     _fresh_jive.rb
  index.html
  new.html
  _fresh_jive.html
</code></pre>

## The SubView Class

class Index
  include SubView

end


## Initialization


<label id='some_label'>JOhn Doe</label>

def initialize 
  self.some_label.value = current_customer.name
end

<label id='some_label'>John Doe</lable> 

label :some_label do |l| 
  l.text = 'John Doe'
end

## Conditions


<% if @order.size > 0 %>
    -- order table --
  <table id='order_table'>
  </table> 
<% else %>
    Sorry no orders exist
<% end %>

def initialize
  @orders = Order.find(:all)
  if @orders.size < 0
    self.('#order_table').hide()
  end
end

table :order_table do |t|
  @orders = DeliveryOrders.find(:all)
  if @orders > 0
    t.data = @orders
  else
    t.hide
    '#message'.show
  end
end

- actually removes from resulting html, not just turning off style 

## Forms


- No more form helpers, set object and url in twin.
- name in html can match object or not

<form action="/session" method="post" id='session_form'>
  <label class="gt-login-label">Username</label>
  <input class="gt-form-text" id="login" name="login" type="text" />
  
  <label class="gt-login-label">Password</label>
  <input class="gt-form-text" id="password" name="password" type="password" />
</form>   

this.session_form = Session
this.session_form.action = new_session_path()
this.session_form.login = Session.login 
this.session_form.password = Session.password 

  form :some_form do |f|
    customer = current_customer
    f.action = new_customer_path
    f.name = current_customer.first_name
    f.email = current_customer.email
  end

## Beautiful Blocks

### A generic box to encapsulate some text

def box(title = nil, *args, &block)
  options = args.extract_options!
  style = options[:style] ? " style = '#{options[:style]}'" : ''

  b = "<div class=\"box\"#{style}>#{box_label(title) if title}"
  e = '</div>'

  data = capture(&block)
  res = b + data + e
  concat(res, block.binding)
end

<% box('Name:') do %>
  <%=h @some_object.name %>
<% end %>


## Collections


<div id='object_collection'>
   <tr><td id='object_value'>  </td></tr>
</div>

object_collection = Object.find(:all)
object_collection.value = Object.boo


## Partials/Includes


<div id='products_partial'></header>

- automatically includes ruby partial view if id has _partial

_products.html
_products_view.rb

- mini-ruby code snippet
- html include type partial

- has reference to the Page View it is included in! allowing no passing of variables

<label id='product_name'/>
<label id='product_cost'/>

self.products.each do |product|
    self.product_name = product.name
    self.product_cost = currency_value(product.cost)
end


## Application Layout


in the SubView class you can specify your enclosing application layout

class ProductView 
  include SubView 
  
  template :application 

end


\layouts\application.html

<div id='view_body'/>


## Themes


Amazingly easy to build Themes.

All you need is standard HTML with the right set of css tags!

No code just switch out html files.


## Header/Bundling

| parameters to controller are available in View or variables set
| ideally use parameters 

def initalize
  @product = Product.find(id)
  self.head.meta_tag = @product.title 
  self.head.include_javascript = auto_link
end


### Hooking up to the Mighty Merb

Kernel::use_template_engine

use_template_engine :sub_view


## Ajax Events

Creates the plumbing for handling presentation centric ajax calls. 

By just having the event method defined, underlying jquery will be generated and along with Metal will create the routing to send it to your presentation class:

  event :selector, :event => :onMouseOut do |e|
    # e is an event class to reference 
    addresses = Address.find(:all)
  end

  # callback javascript with the e (Event) class allowing you to pass info and
  # intercept view 
  event :selector, :event => :onMouseOut, :call => 'javaScript' do |e|
    addresses = Address.find(:all)
  end
 
  event :some_form, :event => :onSubmit do
    # a no-no go to RESTful controllers
  end


## CSS3 Selectors 

Support for all CSS3 selectors 

http://www.w3.org/TR/css3-selectors/

## Full Example 


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
