
class Revolutions::Index < subView::View 
  layout :application # application is default 
  
  
  def initialize
    self.yo_label = 'Yo'  

    @orders = Order.find(:all)
    if @orders.size < 0
    	order_table.hide
    end
    
  end
  
end



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
