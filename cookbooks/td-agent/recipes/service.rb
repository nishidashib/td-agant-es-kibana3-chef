#
# Cookbook Name:: td-agent
# Recipe:: default
#
# Copyright 2011, Treasure Data, Inc.
#

Chef::Recipe.send(:include, TdAgent::Version)
Chef::Provider.send(:include, TdAgent::Version)

service "td-agent" do
  action :restart 
end
