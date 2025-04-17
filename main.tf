module "tools" {
  for_each       = var.tools
  source         = "./module"
  instance_type  = each.value["instance_type"]
  port_no        = each.value["port_no"]
  zone_id        = var.zone_id
  name           = each.value["name"]
  policy_actions = each.value["policy_actions"]
}