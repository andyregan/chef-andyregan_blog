#
# Cookbook Name:: andyregan_blog
# Recipe:: default
#
# Copyright 2013, andyregan
#
# All rights reserved - Do Not Redistribute
#

include_recipe "git"

directory node['andyregan_blog']['deploy_dir'] do
  recursive true
end

git node['andyregan_blog']['deploy_dir'] do
  repository "git://github.com/andyregan/andyregan.net.git"
  reference "master"
  revision "HEAD"
  action :sync
end
