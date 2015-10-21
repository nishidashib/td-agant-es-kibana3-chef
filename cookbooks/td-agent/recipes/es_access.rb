td_agent_match 'es_access' do
  tag  '{sp,pc}'
  type 'elasticsearch'
  params(host: 'localhost',
         port: 9200,
		 logstash_format:true,
		 logstash_prefix:'apache',
		 flush_interval:'10s',
		 include_tag_key:true,
		 tag_key:'@log_name',
		 type_name:'apache-access'
         )
end
