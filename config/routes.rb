Rails.application.routes.draw do
  #need to change these to posts
get("/", {controller: "users", action: "index"})
get("/users", {controller: "users", action: "index"})
get("/users/:path_username",{controller: "users", action: "show"})
get("/photos", {controller: "photos", action: "index"})
end
