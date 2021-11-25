class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/lists" do
    # get all lists from db
    lists = List.all
    # return json of all lists
    lists.to_json
  end

  get "/lists/:list_id" do
    # find specific list with params
    list = List.find(params[:list_id])
    # return json of the list including associated items
    list.to_json(include: :items)
  end

  delete "/lists/:list_id" do
    # { message: "I should delete your requested list and associated items"}.to_json
    # find specific list
    list = List.find(params[:list_id])
    # map through associated items and destroy each item
    list.items.map do |item|
      item.destroy
      end
    # destroy the list
    list.destroy
    # return the json
    list.to_json
  end
  

  delete "/items/:item_id" do
    # { message: "I should delete a specific item on your list."}.to_json
    # find specific item
    item = Item.find(params[:item_id])
    # destroy item
    item.destroy
    # return the json
    item.to_json
  end

  post "/lists" do
    # { message: "I should create a new empty list"}.to_json
    # create list using each param
    list = List.create(
      list_name: params[:list_name]
    )
    # return the json
    list.to_json
  end

  post "/lists/:list_id/items" do # maybe should just be items? 
    # create an item on a list using params
    item = Item.create(
      item_name: params[:item_name],
      item_description: params[:item_description],
      is_complete: params[:is_complete],
      list_id: params[:list_id]
    )
    item.to_json
  end

  patch "/lists/:list_id" do
    list = List.find(params[:list_id])
    list.update(
      list_name: params[:list_name]
    )
    list.to_json
  end

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
