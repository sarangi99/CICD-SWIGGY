pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sarangi99/CICD-SWIGGY.git'
            }
        }
        stage('Compile') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Deploy') {
            steps {
                // deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcat-cred', path: '', url: 'http://16.163.145.83:9090')], contextPath: null, war: '**/*.war'
            cp /var/lib/jenkins/workspace/pipeline01/target/ *.war /home/maha/tomcat/webapps/
            }
        }
    }
}