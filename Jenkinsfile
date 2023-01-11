pipeline {
    agent any

    stages {
       stage('Build') {
            steps {
                bat 'mvn clean'
                bat 'mvn package'

            }
        }
        stage('Analyse') {
            steps {
                bat 'mvn pmd:pmd'

            }
        }
    }

    post {
        always {
            archiveArtifacts '/target/*.jar'
            junit '**/surefire-reports/*.xml'
        }

    }

}