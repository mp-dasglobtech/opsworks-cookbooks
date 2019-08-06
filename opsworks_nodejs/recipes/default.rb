# Remove installed version, if it's not the one that should be installed.
# We only support one user space nodejs installation

PACKAGE_BASENAME = "opsworks-nodejs"
LECAGY_PACKAGES = []

pm_helper = OpsWorks::PackageManagerHelper.new(node)
current_package_info = pm_helper.summary(PACKAGE_BASENAME)


Chef::Log.info("JP_ Ready to roll")
execute "apt-get install curl"
Chef::Log.info("Stage 1")
execute "curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -"
Chef::Log.info("Stage 2")
execute "apt-get update"
Chef::Log.info("Stage 3")
execute "apt-get install nodejs"
Chef::Log.info("Stage 4")
execute "apt-get install git-core"
