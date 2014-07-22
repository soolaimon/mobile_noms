json.location do
  json.name    @location.truck.name
  json.address @location.address
  json.latitude @location.latitude
  json.longitude @location.longitude
end
