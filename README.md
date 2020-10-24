# Jenkins
Jenkins implementation with docker. Typical jenkins installations require configuration by user interaction. This repository aims to provide a repeatable installation with configuration through the following folders/files:

* plugins.txt: Configuration of pluggins

Using the job dsl plugin, the following will be created automatically:
* groovy/folder.groovy: Creates folder structure
* groovy/**/*.groovy: Creates any jobs within folder/subfolder