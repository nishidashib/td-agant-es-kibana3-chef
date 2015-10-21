# Encoding: utf-8
#
# Cookbook Name:: elasticsearch
# Recipe:: default
#

include_recipe 'chef-sugar'
include_recipe 'curl'

# see README.md and test/fixtures/cookbooks for more examples!
elasticsearch_user 'elasticsearch'
elasticsearch_install 'elasticsearch' do
	version '1.7.2'
end
elasticsearch_configure 'elasticsearch' do
	configuration ({
		    'http.cors.enabled' => true
	})
end
elasticsearch_service 'elasticsearch'

# by default, no plugins
elasticsearch_plugin 'mobz/elasticsearch-head' do
end

service 'elasticsearch' do
	action :restart
end		

