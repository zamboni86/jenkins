# Jenkins
Jenkins implementation with docker. Typical jenkins installations require configuration by user interaction. This repository aims to provide a repeatable installation with configuration through the following folders/files:

* plugins.txt: Configuration of pluggins
* groovy/*:    Seed job to create jobs via the job dsl plugin. Jobs under the groovy folder will be automatically created