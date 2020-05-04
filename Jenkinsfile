pipeline {
    agent { docker {
        image 'hashicorp/terraform'
        args '--entrypoint='
    }
    }

    environment {

        TENANT_ID = credentials('tenantid')
        CLIENT_ID     = credentials('clientid')
        SUBSCRIPTION_ID = credentials('subscriptionid')
        CLIENT_SECRET   = credentials('clientsecret')
    }

       parameters {
        string(name: 'nombrevm', defaultValue: 'default')
        string(name: 'resourcegroup', defaultValue: 'Test_Group')
        string(name: 'location', defaultValue: 'North Europe')
        string(name: 'sgname', defaultValue: 'Test SG')
        string(name: 'vm_size', defaultValue: 'Standard_B2ms')
        string(name: 'volume_size_instance1', defaultValue: '20')
        string(name: 'storage_os_disk_name', defaultValue: 'TestOS_disk')
        string(name: 'network_name', defaultValue: 'Testnetwork')
        string(name: 'publicip_name', defaultValue: 'TestIP')
        string(name: 'publicip_allocation_method', defaultValue: 'Dynamic')
        string(name: 'subnet_name', defaultValue: 'TestSubnet')
        string(name: 'nic_name', defaultValue: 'TestNIC')
        string(name: 'nic_ip_configuration_name', defaultValue: 'TestIPconfiguration')
        string(name: 'tag_project', defaultValue: 'CI-il25-test')
    }

    stages {

        stage('init') {

            steps {
                sh 'printenv'
                sh 'terraform init'
            }

        }



          stage('execute plan') {

            steps {
                sh 'terraform plan -out=tfplan -input=false -var tenant_id=$TENANT_ID -var client_secret=$CLIENT_SECRET -var client_id=$CLIENT_ID -var subscription_id=$SUBSCRIPTION_ID -var env_name=$nombrevm -var location=$location -var location=$location -var vm_resource_group_name=$resourcegroup -var vm_sg_name=$sgname -var vm_size=$vm_size -var volume_size_instance1=$volume_size_instance1 -var storage_os_disk_name=$storage_os_disk_name -var network_name=$network_name -var publicip_name=$publicip_name -var subnet_name=$subnet_name -var nic_name=$nic_name -var nic_ip_configuration_name=$nic_ip_configuration_name tag_project=$tag_project  '
            }

            }

            stage('execute apply') {

            steps {
                sh 'cat "tfplan"'
            }

        }


    }
}
