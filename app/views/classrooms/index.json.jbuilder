json.array! @classrooms do |classroom|
  json.id classroom.id
  json.name classroom.name
  json.students classroom.students do |student|
    json.first_name student.first_name
    json.last_name student.last_name
  end
end
