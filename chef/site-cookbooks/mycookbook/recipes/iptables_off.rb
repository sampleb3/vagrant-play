#
# Cookbook Name:: mycookbook
# Recipe:: iptables_off
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# iptables OFF
service "iptables" do
  supports :status => true, :restart => true, :reload => true
  action [:disable, :stop]
end
