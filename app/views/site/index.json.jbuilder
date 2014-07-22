
json.trucks @trucks do |truck|
  json.id   truck.id
  json.name truck.name
  json.latitude truck.location.latitude
  json.longitude truck.location.longitude
  json.address truck.location.address
end

json.current_location do
  json.latitude session[:latitude]
  json.longitude session[:longitude]
end


