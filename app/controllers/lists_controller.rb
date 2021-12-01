class ListsController < ApplicationController

    #read lists

    get "/lists" do
        # get all lists from db
        lists = List.all
        # return json of all lists
        lists.to_json
    end
    
    #read list (specific)

    get "/lists/:list_id" do
        # find specific list with params
        list = List.find(params[:list_id])
        # return json of the list including associated items
        list.to_json(include: :items)
    end

    #delete list (specific)

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

    #create list

    post "/lists" do
        # { message: "I should create a new empty list"}.to_json
        # create list using each param
        list = List.create(
          list_name: params[:list_name]
        )
        # return the json
        list.to_json
      end

end