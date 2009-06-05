# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class SubView
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/sub_view/
      
      [200, {"Content-Type" => "text/html"}, ["Hello, World!"]]
      # route needs to confirm to the page_view class /sub_view/product/index
      # jQuery routes correctly, passes json in body?
      # unpack json pass as parameters to sub view ajax server side method
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
