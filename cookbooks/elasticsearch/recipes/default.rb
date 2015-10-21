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
bash 'injecting template' do
  code <<-EOF
curl -XPUT http://localhost:9200/_template/apache -d '
{
        "template":"apache-*",
        "mappings":{
                "apache-access":{
                        "properties":{
                                "agent":{
                                        "index":"not_analyzed",
                                        "type":"string"
                                },
                                "fullurl":{
                                        "index":"not_analyzed",
                                        "type":"string"
                                },
                                "host":{
                                        "index":"not_analyzed",
                                        "type":"string"
                                },
                                "contents":{
                                        "index":"not_analyzed",
                                        "type":"string"
                                },
                                "hostname":{
                                        "index":"not_analyzed",
                                        "type":"string"
                                }
                        }
                }
        }
}
'
  EOF
end

service 'elasticsearch' do
	action :restart
end		

