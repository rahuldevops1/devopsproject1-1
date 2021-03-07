pipeline{
    agent any

    tools{
        maven "m3"
        jdk "jdk8"
    }

    stages{
        
        stage('Build FrontEnd'){
            agent {
                docker { image 'node'}
                
            }
            steps{
                sh 'npm install'
                sh 'npm compile'
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