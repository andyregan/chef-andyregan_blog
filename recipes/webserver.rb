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

template "/etc/nginx/sites-available/#{node['andyregan_blog']['server_name']}.conf" do
  source "nginx_site.conf.erb"
end

nginx_site node['andyregan_blog']['server_name'] do
  action :enable
end
