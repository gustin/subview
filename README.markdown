# Altered View 

A next-gen template engine -- cause mixing ruby codes and semantic html (ehem erb) SUCKS!!

erb was created in 1999, a 20th century technology.

Ruby Template Framework for the 21st Century!


## Initialization


<label id='some_label'/>

def initialize 
	self.some_label.value = current_customer.name
end

<label id='some_label'>John Doe</lable> 

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
		order_table.hide()
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


in the PageView class you can specify your enclosing application layout

class ProductView < PageView 
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

