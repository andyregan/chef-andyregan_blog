default['andyregan_blog']['server_name'] = 'andyregan.net'
default['andyregan_blog']['deploy_dir'] = "/srv/www/#{node['andyregan_blog']['server_name']}"
default['andyregan_blog']['docroot'] = "#{node['andyregan_blog']['server_name']}/public"
