require File.expand_path('~/.aws_ruby_config.rb')
and the contents of .aws_ruby_config.rb contain the standard ruby include and the AWS key:

require 'aws-sdk'
config = AWS.config({
access_key_id: 'MYACCESSKEYID',
secret_access_key: 'MYSECRETACCESSKEY',
region: 'us-east-1'
});
Modification #1– picking the AMI
As a tester, one clearly want to know exactly what image is being deployed (as opposed to the example which is basically the latest Amazon Linux AMI.  Picking the correct AMI required knowledge of magic string constants not actually in the ruby api, instead checking the cli examples is fruitful.  I ended up with something simple:

ec2.images.filter("image-id", "ami-916fd3f8")
Modification #2 — using your own key/security group
The example is generating a new key pair every run, which seems like a mistake in testing, so I changed it to query for my key like this:

my_key =  ec2.key_pairs.select { |s| s.name =~ /jon.malachowski/ }.first
puts "Using keypair #{my_key.name}, fingerprint: #{my_key.fingerprint}"
and in a similar vein I like to select a pre-made security group in general:

group =  ec2.security_groups.select { |s| s.name =~ /jon.malachchowski/ }.first
puts "Using security group: #{group.name}"
 

Modification #3 — allocating an elastic/static ip
Pulling things out of the response to a creation reponse is really common in AWS’s api.  I’ll show a lot of examples of that in my next post probably.

static_ip_resp = ec2.client.allocate_address
puts "Using ip: #{static_ip_resp[:public_ip]}"
ec2.client.associate_address( :instance_id=>instance.id, :public_ip=>static_ip_resp[:public_ip] )
Modification #4 — naming the instance
When verifying a setup with the AWS web ui it is nice to use that custom tag it calls out for the instance name.

ec2.client.create_tags( :resources=>[instance.id], :tags=>[:key=>"Name",:value=>instance_name] )