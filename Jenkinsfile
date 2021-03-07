pipeline{
    agent any

    tools{
        maven "m3"
        jdk "jdk8"
    }

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
                    docker {image 'maven:adoptopenjdk'}
                }
            steps{
                sh 'mvn package'
            }
        }

    }
}