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
        stage('Upload Jar to Nexus') {
            steps {
                    nexusArtifactUploader artifacts: [
                        [
                            artifactId: 'SimpleAstronomyLib',
                            classifier: '',
                            file: 'target/SimpleAstronomyLib-1.0.0-snapshot.jar',
                            type: 'jar'
                        ]
                            ],
                            credentialsId: 'nexus3',
                            groupId: 'com.bradsbrain',
                            nexusUrl: 'localhost:8081/repository/Simple-Astro/',
                            nexusVersion: 'nexus3',
                            protocol: 'http',
                            repository: 'http://localhost:8081/repository/Simple-Astro/',
                            version: '1.0.0-snapshot'


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