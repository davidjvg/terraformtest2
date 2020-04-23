resource "azurerm_virtual_machine" "vm" {
    name                  =   var.env_name
    location              =   var.location
    resource_group_name   =   azurerm_resource_group.vm_resource_group.name
    network_interface_ids = [  azurerm_network_interface.nic.id ]
    vm_size               =   var.vm_size

    storage_os_disk {
        name              =   var.storage_os_disk_name
        caching           =   var.storage_os_disk_caching
        create_option     =   var.storage_os_disk_create_option
        managed_disk_type =   var.storage_os_disk_managed_disk_type
    }

    storage_image_reference {
        publisher =   var.storage_image_reference_publisher
        offer     =   var.storage_image_reference_offer
        sku       =   var.storage_image_reference_sku
        version   =   var.storage_image_reference_version
    }


# No aditional disks for Sonar Server

  #  storage_data_disk {
  #  name              =   var.storage_data_disk_name
  #  managed_disk_type =   var.storage_data_disk_managed_disk_type
  #  create_option     =   var.storage_data_disk_create_option
  #  lun               =   var.storage_data_disk_lun
  #  disk_size_gb      =   var.storage_data_disk_disk_size_gb
#}

    os_profile {
        computer_name  =   var.env_name
        admin_username =   var.admin_username
    }

    os_profile_linux_config {
        disable_password_authentication =   var.os_profile_linux_config_disable_password_authentication
        ssh_keys {
            path      = "/home/${var.admin_username}/.ssh/authorized_keys"
            key_data  = file("ubuntu.pub")
        }
    }

#    boot_diagnostics {
#        enabled      = true"
#        storage_uri =   azurerm_storage_account.mystorageaccount.primary_blob_endpoint
#    }

    tags = {
        environment =   var.tags_environment_instance
        component =     var.tags_component_instance
    }
}

resource "azurerm_virtual_machine_extension" "vmext" {
    resource_group_name     = azurerm_resource_group.vm_resource_group.name
    location                = var.location
    name                    = azurerm_virtual_machine.vm.name

    virtual_machine_name = azurerm_virtual_machine.vm.name
    publisher            = "Microsoft.Azure.Extensions"
    type                 = "CustomScript"
    type_handler_version = "2.0"

    protected_settings = <<PROT
    {
        "script": "${base64encode(file(var.scfile))}"
    }
    PROT
}
