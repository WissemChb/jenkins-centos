FROM centos:latest

MAINTAINER BEN CHAABEN Wissem<benchaaben.wissem@gmail.com>

#changing the root user
USER root

#Install Jenkins Prequisites
RUN yum update -y && \
    yum groupinstall -y 'development tools' && \
    yum  install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel epel-release wget


#Install Jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo && \
    rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key && \
    yum install -y jenkins

ENV JENKINS_HOME /var/jenkins_home

#For web interface
EXPOSE 8080

#For jenkins agent
EXPOSE 50000

CMD [ "/usr/bin/java","-jar","/usr/lib/jenkins/jenkins.war" ]



