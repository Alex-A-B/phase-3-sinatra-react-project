class ItemsController < ApplicationController
    
    #delete item (specific)

    delete "/items/:item_id" do
        # { message: "I should delete a specific item on your list."}.to_json
        # find specific item
        item = Item.find(params[:item_id])
        # destroy item
        item.destroy
        # return the json
        item.to_json
    end

    #create item 
    
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

end