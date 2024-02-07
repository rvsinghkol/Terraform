# Get List of Availability Zones in a Specific Region
# Region is set in c1-versions.tf in Provider Block
# Datasource-1
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Datasource
data "aws_ec2_instance_type_offerings" "my_ins_type" {
    for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }
  filter {
    name = "location"
    values = [each.key]
  #  values = ["ap-south-1c"]
  }

  location_type = "availability-zone"
  
}

# Important Note: Once for_each is set, its attributes must be accessed on specific instances
output "output_3" {
#  value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
   value = toset([for t in data.aws_ec2_instance_type_offerings.my_ins_type: t.instance_types])
}

#Output-2
# Create a Map with Key as Availability Zone and value as Instance Type supported
output "output_3_1" {
    value = {
        for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: 
        az => details.instance_types if length(details.instance_types) !=0 }
  
}
# Output-3
# Filtered Output: with Keys Function - Which gets keys from a Map
# This will return the list of availability zones supported for a instance type
output "output_3_2" {
    value = keys({
        for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: 
        az => details.instance_types if length(details.instance_types) !=0 })
}        
# Output-4 (additional learning)
# Filtered Output: As the output is list now, get the first item from list (just for learning)
output "output_v3_4" {
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: 
    az => details.instance_types if length(details.instance_types) != 0 })[0]
}