#
# Cookbook Name:: andyregan_blog
# Recipe:: default
#
# Copyright 2013, andyregan
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"

directory '/srv/www'

nginx_site node['andyregan_blog']['server_name'] do
  template "nginx_site.conf.erb"
  action :enable
end
