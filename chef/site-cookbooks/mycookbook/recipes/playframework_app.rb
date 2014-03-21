#
# Cookbook Name:: mycookbook
# Recipe:: playframework_app
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{expect}.each do |pkg|
  package pkg do
    action :install
  end
end

# アプリケーションディレクトリの作成
# expectを使用して、対話コマンドに対応
template "/tmp/install_play.exp" do
  source "install_play.exp.erb"
  mode "755"
  owner node['playframework']['user']
  group node['playframework']['group']
  variables({
     :application_path => node['playframework']['application']['path'],
     :application_name => node['playframework']['application']['name']
  })
end

bash "play new" do
  creates "#{node['playframework']['application']['path']}"
  user node['playframework']['user']
  code <<-BASH
    /tmp/install_play.exp
  BASH
end

# 起動スクリプトを作成
template "/etc/init.d/play" do
  source "play.erb"
  mode "755"
  owner "root"
  group "root"
  variables({
     :play_home => node['playframework']['play_home'],
     :user => node['playframework']['user'],
     :application_path => node['playframework']['application']['path']
  })
end

# サービス設定
service "play" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end
