json.array! @students do |student|
  json.id student.id
  json.first_name student.first_name
  json.last_name student.last_name
end
