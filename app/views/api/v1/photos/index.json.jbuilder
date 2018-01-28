json.data do
  json.array! @photos do |photo|
    json.partial! "photo", photo: photo
  end
end
