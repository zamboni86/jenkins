# Jenkins
Jenkins implementation with docker. Typical jenkins installations require configuration by user interaction. This repository aims to provide a repeatable installation with configuration through the following files:

* Configuration of pluggins in plugins.txt
* Seed job to create jobs via the job dsl plugin. Jobs under the groovy folder will be automatically created