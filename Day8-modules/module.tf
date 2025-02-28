module "dev" {
    source = "../Day2-basic-code-for-module-source"
    ami_id = var.ami_id
    type = var.type
    key = var.key
  
}