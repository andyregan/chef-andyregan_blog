#
# Cookbook Name:: andyregan_blog
# Recipe:: default
#
# Copyright 2013, andyregan
#
# All rights reserved - Do Not Redistribute
#

include_recipe "git"

directory '/srv/www'

git node['andyregan_blog']['docroot'] do
  repository "git://github.com/andyregan/andyregan.net.git"
  reference "master"
  revision "HEAD"
  action :sync
end
