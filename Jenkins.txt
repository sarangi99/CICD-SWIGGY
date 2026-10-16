pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Compile') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Package') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Hello World'
            }
        }
    }
}