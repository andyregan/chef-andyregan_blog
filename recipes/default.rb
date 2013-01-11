#
# Cookbook Name:: andyregan_blog
# Recipe:: default
#
# Copyright 2013, andyregan
#
# All rights reserved - Do Not Redistribute
#

include_recipe "andyregan_blog::deploy_head"
include_recipe "andyregan_blog::webserver"
