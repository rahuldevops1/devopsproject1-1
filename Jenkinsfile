pipeline{
    agent any

    stages{
        stage('Checkout SCM'){
            steps{
                checkout scm
            }
        }
        stage('Build FrontEnd'){
            agent {
                docker { image 'node:current-alpine3.13'}
                
            }
            steps{
                sh 'npm install'
                sh 'npm build'
            }

        }
        stage('Build BackEnd'){
            agent{
                    docker {image 'maven:3.6.3-adoptopenjdk-8'}
                }
            steps{
                sh 'sudo mvn package'
                archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
            }
            
        }

    }
}