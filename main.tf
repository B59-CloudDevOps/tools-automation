module "tools" {
  for_each = var.tools
  source   = "./module"


}