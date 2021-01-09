node
{
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])
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
        sshagent(['25c01b08-8d43-46c4-a338-19a2e21497c3'])
        {
            sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.45.14:/opt/apache-tomcat-9.0.41/webapps/"
        }
    }
}
