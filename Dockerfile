FROM jenkins/jenkins

# Disable install wizard
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

USER jenkins

# create initial seed job
RUN mkdir -p /usr/share/jenkins/ref/jobs/seed-job
COPY seed-job.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

# copy groovy scripts
RUN mkdir -p $JENKINS_HOME/groovy
COPY ./groovy $JENKINS_HOME/groovy

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt