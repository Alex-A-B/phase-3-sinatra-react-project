class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

 

  
  

  #update lists - wip

  patch "/lists/:list_id" do
    list = List.find(params[:list_id])
    list.update(
      list_name: params[:list_name]
    )
    list.to_json
  end

  #update items - wip

  patch "/items/:item_id" do
    item = Item.find(params[:item_id])
    item.update(
      item_name: params[:item_name],
      item_description: params[:item_description],
      is_complete: params[:is_complete]
    )
    item.to_json 
  end

end
