node
{
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('5 * * * *')])])
    def MvnHome = tool name: "maven3.6.3"
    stage('git pull')
    {
        git branch: 'development', credentialsId: 'github', url: 'https://github.com/gkdevopstraining/maven-web-application.git'
    }
    stage('mvn build')
    {
        sh "${MvnHome}/bin/mvn clean package"
    }
    stage('Deploy code to tomcat')
    {
        sh "scp -o StrictHostKeyChecking=n target/maven-web-application.war ec2-user@3.134.79.104:/opt/apache-tomcat-9.0.41/webapps/pipe.war"
    }
}
