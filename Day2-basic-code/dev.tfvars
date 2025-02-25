ami_id = "ami-05b10e08d247fb927"
type = "t2.micro"
key = "vin"




#note:- if the name is defualt terraform.tfvars we can run regular process no need to mention
#note:-if user can give custom .tfvars name like example dev.tfvars process follow below
#terraform plan -var-file="dev.tfvars"
#terraform apply -var-file="dev.tfvars"