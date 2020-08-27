FROM jenkins/jenkins

# Disable install wizard
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false

# Add minimum jenkins setup
ADD init.groovy.d /usr/share/jenkins/ref/init.groovy.d
ADD dsl /usr/share/jenkins/ref/dsl
COPY scriptApproval.xml /var/jenkins_home/scriptApproval.xml

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt