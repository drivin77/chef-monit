#
# Cookbook Name:: monit
# Recipe:: install_package
#

rpm_file = "monit-5.5-1.el6.rf.x86_64.rpm"

remote_file "#{Chef::Config[:file_cache_path]}/#{rpm_file}" do
  source "http://pkgs.repoforge.org/monit/#{rpm_file}"
  action :create_if_missing
  notifies :run, "execute[install-monit-package]"
end

execute 'install-monit-package' do
  command "rpm -i #{Chef::Config[:file_cache_path]}/#{rpm_file}"
  action :nothing
end
