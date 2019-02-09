class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      @@cart.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/add/)
      item = req.params["GET"]
      resp.write add_item_to_cart(item)
      end
    else
      resp.write "Path Not Found"
    end

    resp.finish
    
   
    
     elsif req.path.match(/add/)
      item = req.params["GET"]
      resp.write add_item_to_cart(item)
      
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
  
  def add_item_to_cart(item)
    if @@items.include?(item)
      @@cart << item 
      return "Your cart now includes #{@@cart}."
    else 
      return "#{item} does not exist."
    end 
  end
end
