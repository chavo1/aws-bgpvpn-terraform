describe command('terraform state list') do
  its('stdout') { should include "module.consul_vpc.aws_vpc.consul_vpc" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
describe command('terraform state list') do
  its('stdout') { should include "module.consul_vpc.aws_route_table_association.private" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
describe command('terraform state list') do
  its('stdout') { should include "module.consul_vpc.aws_security_group.sg-group" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end

