variable "rg_name" {
    type = string
    description = "Name of the Resources Group"
}

variable "serviceplan_name" {
    type = string
    description = "Name of the App Service Plan"
}

variable "appservice_name" {
    type = string
    description = "Name of the App Service"
}

variable "location" {
    type = string
    description = "Name of the Azure region"
}