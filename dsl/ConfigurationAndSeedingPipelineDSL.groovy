
node('master') {
  stage('Checkout') {
    // Clean workspace and checkout shared library repository on the jenkins master
    cleanWs()
    checkout scm
  }

  stage('Configuration') {
    // set CasC config in master
    sh('cp /var/jenkins_home/workspace/Admin/Configure/resources/config/configuration-as-code-plugin/jenkins.yaml /var/jenkins_home/jenkins.yaml')

    // run CasC
    load('resources/config/groovy/triggerConfigurationAsCodePlugin.groovy')

    // set public key for agent-on-demand bootstrapping user
    load('resources/config/groovy/userPublicKeys.groovy')

    // set the timezone
    load('resources/config/groovy/timezone.groovy')
  }

  // Create agent networks in cloud provider with terraform
  stage('Deploy Agent Networks') {
    ansiColor('xterm') {
      sh('ln -sfn /var/jenkins_home/agent-bootstrapping-terraform-config/aws-agent-network.backend.config resources/terraform/aws/agent-network/')
      sh('ln -sfn /var/jenkins_home/agent-bootstrapping-terraform-config/aws-agent-network.tfvars resources/terraform/aws/agent-network/terraform.tfvars')
      sh('cd resources/terraform/ && make deploy-agent-network')
    }
  }
  
  stage('Job Seeding') {
    jobDsl(targets: 'resources/jobDSL/*.groovy', sandbox: false)
  }
}