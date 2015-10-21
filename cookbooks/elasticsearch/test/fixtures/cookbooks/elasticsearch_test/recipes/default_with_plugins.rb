# Encoding: utf-8
#
# Cookbook Name:: elasticsearch_test
# Recipe:: default_with_plugins
#
# This cookbook is designed to be just elasticsearch::default plus installing
# some plugins. We want to test the default plugin resource without any
# interesting overrides, but don't want to ship that as a recipe in the main
# cookbook (unlike install, configure, and service, which we do ship in the
# default cookbook).

# see README.md and test/fixtures/cookbooks for more examples!
include_recipe 'elasticsearch::default'

# by default, no plugins
elasticsearch_plugin 'mobz/elasticsearch-head'
