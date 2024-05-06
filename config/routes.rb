Rails.application.routes.draw do

  #Homepage
  get("/", {:controller => "users", :action => "index"})

  # User
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})
  post("/update/:past_username", {:controller => "users", :action => "update"})

  #Photos
  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:path_id", {:controller => "photos", :action => "show"})
  get("delete_photo/:photo_id", {:controller => "photos", :action => "delete"})
  post("update_photo/:update_id", {:controller => "photos", :action => "update"})
  post("insert_photo", {:controller => "photos", :action => "insert"})


end
