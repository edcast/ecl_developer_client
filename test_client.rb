require './lib/ecl_developer_client'
client_id ='Dfsn19ehHA'
secret ='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc19kZXZlbG9wZXIiOnRydWUsImNsaWVudF9pZCI6IkRmc24xOWVoSEEifQ.npB8vBKFfUUSi9OCSykqDzzbnPgu1w1u25ZrmiBk1Bo'
EclDeveloperClient.configure do |config|
  config.ecl_app_url = "http://localhost:3000/api/developer/v1"
end

# ---- Source Type ----
# search source_type by name
service = EclDeveloperClient::SourceType.new(client_id,secret)
service.get(name: "sociative_source")
service.response_data

# create source type
service = EclDeveloperClient::SourceType.new(client_id,secret)
params = {
  name: 'sample source type',
  display_name: 'Sample',
  is_singleton: true,
  is_public: true,
  identifying_keys: [],
  required_keys: [],
  is_hidden: true,
  default_available: false
}
service.create(params)
service.response_data

# update source type
source_type_id = "a96138ca-e3ec-470c-a977-51e021d3e170"
service = EclDeveloperClient::SourceType.new(client_id,secret)
service.update(source_type_id, {display_name: 'test display'})
service.response_data

# delete source type
source_type_id = "a96138ca-e3ec-470c-a977-51e021d3e170"
service = EclDeveloperClient::SourceType.new(client_id,secret)
service.delete(source_type_id)
service.response_data



# ---- Source ----
# Find source with id
source_id = "01ed5cde-9190-49e3-8e0c-052d37c8a4de"
service  = EclDeveloperClient::Source.new(client_id,secret)
service.find(source_id)
service.response_data

# search source by source_config
service = EclDeveloperClient::Source.new(client_id,secret)
service.get(source_config: {"client_id"=>"libraryapi-client-ge",
 "client_secret"=>"22gU2EXvdVCXFUHrdhhG"})
service.response_data

# create source
source_type_id = "a96138ca-e3ec-470c-a977-51e021d3e170"
service = EclDeveloperClient::Source.new(client_id,secret)
params = {
  source_type_id: source_type_id,
  display_name: 'Sociative: abc.com',
  source_config: {
    domain: "abc.com"
  },
  is_default: true,
  is_enabled: true
}
service.create(params)
service.response_data

# update source
source_id = "01ed5cde-9190-49e3-8e0c-052d37c8a4de"
service = EclDeveloperClient::Source.new(client_id,secret)
service.update(source_id, { display_name: 'test display'})
service.response_data

# delete
source_id = "01ed5cde-9190-49e3-8e0c-052d37c8a4de"
service = EclDeveloperClient::Source.new(client_id,secret)
service.delete(source_id)
service.response_data

# trigger_collector
source_id = "01ed5cde-9190-49e3-8e0c-052d37c8a4de"
service = EclClient::Source.new(client_id,secret)
service.trigger_collector(source_id)
service.response_data

# ---- Content item ----
# create content item
source_type_id = "a96138ca-e3ec-470c-a977-51e021d3e170"
source_id = "01ed5cde-9190-49e3-8e0c-052d37c8a4de"
params = {
  name: "Test String",
  description: "Test description",
  summary: "Test description",
  tags: {},
  taxonomy_topics: "Test description",
  url: "Test String",
  author: "Test String",
  content_type: "Test String",
  source_id: source_id,
  source_type_id: source_type_id,
  external_id: "Test String",
  is_public: boolean,
  nlp_metadata: {},
  duration_metadata: {},
  content: "Test description",
  resource_metadata: {},
  additional_metadata: {},
  raw_record: {},
  taxonomies: {}
}
service = EclClient::ContentItem.new(client_id,secret)
service.create(params)
service.response_data

# get content items
service  = EclClient::ContentItem.new(client_id,secret)
service.get(limit: 30, offset: 1) # or service.get to get default
service.response_data

# find content item
content_id = "007f8d65-410e-49d5-aa77-27ba87eb8576"
service  = EclClient::ContentItem.new(client_id,secret)
service.find(content_id)
service.response_data

# delete content item
content_id = "007f8d65-410e-49d5-aa77-27ba87eb8576"
service  = EclClient::ContentItem.new(client_id,secret,{organization_id: 15})
service.delete(content_id)
service.response_data

# ---- Settings ----
# get ecl settings for organization
organization_id = 15
service  = EclClient::EclSettings.new(client_id,secret)
service.get(organization_id: organization_id)
service.response_data


