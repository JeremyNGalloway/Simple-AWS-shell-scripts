for region in `aws ec2 describe-regions --output text | cut -f4`
do
	aws ec2 describe-instances --region $region --output text --query 'Reservations[*].Instances[*].[InstanceId, InstanceType, ImageId, State.Name, LaunchTime, KeyName, Placement.AvailabilityZone,  PrivateIpAddress, PrivateDnsName, PublicDnsName, [Tags[?Key==`Name`].Value] [0][0], [Tags[?Key==`business_unit`].Value] [0][0], [Tags[?Key==`component`].Value] [0][0], [Tags[?Key==`environment`].Value] [0][0], [Tags[?Key==`resource_owner`].Value] [0][0], [Tags[?Key==`service_name`].Value] [0][0] ]'
done
