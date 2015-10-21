#include_recipe 'apache2'

ark 'kibana' do
    url node['kibana']['url']
    #url 'https://download.elasticsearch.org/kibana/kibana/kibana-3.0.0.tar.gz'
    version node['kibana']['kibana3_version']
    #version '3.0.0'
    checksum node['kibana']['checksum']
    path node['kibana']['base_dir']
	action :put
end
config_path = 'kibana/config.js'

template File.join(node['kibana']['base_dir'], config_path) do
  cookbook node['kibana']['config']['cookbook']
  source node['kibana']['config']['source']
  owner node['kibana']['user']
  group node['kibana']['group']
  mode '0644'
  variables('es_port' => node['kibana']['elasticsearch']['port'], 'index' => node['kibana']['index'])
end

#service "apache2" do 
# action :restart
#end 
