
postgresql_url = "http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-2.noarch.rpm"
postgresql_pkg = "pgdg-centos94-9.4-2.noarch"


package "#{postgresql_url}" do
  not_if "rpm -q #{postgresql_pkg}"
end

%w(postgresql94 postgresql94-devel postgresql94-server).each do |pkg|
  package "Installing Postgres libraries" do
    not_if "rpm -q #{postgresql_pkg}"
  end
end

execute "setting postgresql's user and password" do
  command <<-EOL
    service postgresql-9.4 initdb
    /etc/rc.d/init.d/postgresql-9.4 start
    chkconfig postgresql-9.4 on
    sudo -u postgres psql
    postgres=# \password
    postgres=# create user #{node['postgresql']['db_user']} with password "#{node['postgresql']['db_pass']}";
    postgres=# \q
  EOL
  not_if "rpm -q #{postgresql_pkg}"
end