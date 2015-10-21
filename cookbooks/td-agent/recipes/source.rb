td_agent_source 'source' do
	type 'tail'
	tag 'localhost.access'
     params(path: '/var/log/apache2/access.log',
		    pos_file: '/var/tmp/apache2-access.log.pos',
			format: 'apache2')
end
