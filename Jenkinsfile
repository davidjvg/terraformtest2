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
        string(name: 'nombrevm', defaultValue: 'default', description: 'machine')
        string(name: 'resourcegroup', defaultValue: 'Test_Group', description: 'machine')
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
                sh 'terraform plan -out=tfplan -input=false -var tenant_id=$TENANT_ID -var client_secret=$CLIENT_SECRET -var client_id=$CLIENT_ID -var subscription_id=$SUBSCRIPTION_ID -var env_name=$nombrevm vm_resource_group_name=$resourcegroup '
            }
              
            }  
              
            stage('execute apply') {
            
            steps {
                sh 'cat "tfplan"'
            } 
            
        }

        
    }
}
