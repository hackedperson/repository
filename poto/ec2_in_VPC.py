#/usr/bin/python
import boto.ec2
conn = boto.ec2.connect_to_region("us-west-2")
reservation = conn.run_instances(
    'ami-6989a659',
    key_name='new',
    instance_type='t1.micro',
    security_group_ids=['sg-82169de6'],
	  subnet_id="subnet-5e21a807")

