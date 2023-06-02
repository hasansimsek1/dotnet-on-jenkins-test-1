pipeline {
    agent any
    stages {
        stage('Restore') { 
            steps {
                sh 'pwd'
                sh 'dotnet restore' 
            }
        }
        stage('Build') {
            steps {
                sh 'dotnet build'
            }
        }
        stage('Test') {
            steps {
                sh 'dotnet test'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'pwd'
                sh 'docker build --progress=plain --no-cache --tag sample-project-1-image .'
            }
        }
    }
}