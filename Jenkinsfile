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
                bat 'mvn com.github.spotbugs:spotbugs-maven-plugin:3.1.7:spotbugs'
                bat 'mvn pmd:pmd' 
               
            }
        }
        
        
        stage('Deploy') {
            steps {
                archiveArtifacts '/target/*.jar'
            }
        }
    }
    post {
        always {
            junit '**/surefire-reports/*.xml'
        }

    }

}