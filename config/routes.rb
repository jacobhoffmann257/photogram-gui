Rails.application.routes.draw do
get("/users", {controller: "users", action: "index"})
post("/users/:username")
end
