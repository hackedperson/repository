/usr/bin/python
import boto.ec2

conn = boto.ec2.connect_to_region("us-west-2")
my_code = """#!/bin/bash
sudo apt-get -y update && sudo apt-get -y install apache2
touch /home/ubuntu/test"""


reservation = conn.run_instances(
    'ami-6989a659',
    key_name='new',
    instance_type='t1.micro',
    security_group_ids=['sg-82169de6'],
 user_data =  my_code)
~
