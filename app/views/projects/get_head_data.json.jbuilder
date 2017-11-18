json.array!(@head_data) do |data|
  json.title data.title
  json.content data.content
  json.finding_person data.finding_person
  json.recruitment_style data.recruitment_style
  json.recruiting_feature data.recruiting_feature
  json.image data.image
  json.company_name data.company.name
  json.company_icon data.company.image
end