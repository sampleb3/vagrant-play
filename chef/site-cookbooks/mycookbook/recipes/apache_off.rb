#
# Cookbook Name:: mycookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# -----------------------------------------------------------------
# apache停止
service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [ :disable, :stop ]
end

