#!/usr/bin/ruby


require 'rubygems'
require 'aws-sdk'

ec2 = AWS::EC2.new

new_inst = ec2.instances.create(
  :image_id => ami-6989a659,
  :subnet => ec2.subnets[subnet-5e21a807],
  :instance_type => 't1.micro',
  :key_name => new,
  :security_group_ids => { sg-7452c710 })