#
# Cookbook:: choco
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

#include_recipe "chocolatey::default"

# disable AntiMalware Service Executable
powershell_script 'Set host file so the instance knows where to find chef-server' do
    code <<-EOH
    Set-MpPreference -DisableRealtimeMonitoring $true
    EOH
end

chocolatey_package "sysinternals" do
    options "-y --no-progress"
end

chocolatey_package "7zip"
chocolatey_package "git"
chocolatey_package "notepadplusplus.install"

chocolatey_package "googlechrome"
chocolatey_package "cmder"
chocolatey_package "openssh"
chocolatey_package "setdefaultbrowser"

# enable AntiMalware Service Executable
powershell_script 'Set host file so the instance knows where to find chef-server' do
    code <<-EOH
    Set-MpPreference -DisableRealtimeMonitoring $false
    EOH
end