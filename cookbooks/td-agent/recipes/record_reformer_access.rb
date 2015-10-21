td_agent_match 'record_reformer_access' do
	tag  '*.access'
	type 'record_reformer'
	params( tag:'access',
			record: { 	hostname: '${tag_parts[0]}',
						fullurl: 'http://${host}${path}'
					}
	)
end
