td_agent_match 'rewrite_tag_filter' do
	tag  'access'
	type 'rewrite_tag_filter'
	params(
		rewriterule1: 'agent iphone sp',
		rewriterule2: 'agent Android.*Mobile sp',
		rewriterule3: 'agent .+ pc'
		)	
end
