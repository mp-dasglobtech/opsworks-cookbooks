Chef::Log.info("Setting Environment Variables")
node[:deploy].each do |current_path, deploy, environment_variables|
  Chef::Log.info(deploy[:environment_variables])
  deploy[:environment_variables].each do |name, value|
    ENV["#{name}"] = "#{value}
  end

  Chef::Log.inof("Writing variables to etc/environment to have them after restart")
  template "#{deploy[:current_path]}/.env" do
    source "environment.erb"
    mode "0644"
    owner "ubuntu"
    group "ubuntu"
    variables({
      :environment_variables => deploy[:environment_variables]
      })
  end
end
Chef::Log.info("Setting Environment Variables ends")
