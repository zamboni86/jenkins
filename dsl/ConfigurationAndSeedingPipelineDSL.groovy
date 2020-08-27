#!groovy

// This jobDSL script creates and Admin/Configure pipeline, which will act as
// our seeding and configuration pipeline for Jenkins. The Admin/Configure 
// pipeline uses a shared central library hosted on GitHub.

folder('Admin') {
  description('Folder containing configuration, bootstrapping and seed jobs')
}

pipelineJob("Admin/Configure") {
  
}