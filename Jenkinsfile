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
                docker { image 'node'}
                
            }
            steps{
                sh 'sudo npm install'
                sh 'sudo npm build'
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