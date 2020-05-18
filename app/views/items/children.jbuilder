json.array! @children do |child|
  binding.pry
  json.id child.id
  json.name child.name
end