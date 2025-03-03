locals {
    name = "${var.project_name}-${var.enviroment}"
    az_names = slice(data.availability_zones.azs,0,2)
}