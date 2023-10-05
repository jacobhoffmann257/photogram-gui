Rails.application.routes.draw do
  #need to change these to posts
get("/", {controller: "users", action: "index"})
get("/users", {controller: "users", action: "index"})
get("/users/:path_username",{controller: "users", action: "show"})
get("/photos", {controller: "photos", action: "index"})
get("/photos/:path_id",{ controller: "photos", action: "show"})
get("/delete_photo/:path_id",{controller: "photos", action: "delete"})
post("/create_photo",{controller: "photos", action: "create"})
post("/update/:modifiy_id", {controller: "photos", action: "update"})
post("/add_comment", controller:"photos", action: "comment")
end
