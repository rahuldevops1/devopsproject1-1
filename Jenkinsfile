pipeline{
    agent any
    tools {
        jdk 'jdk8'
        maven 'm3'
    }
    stages
    {
        stage('Preparation') {
            steps {
                sh 'echo hello world'
            }
        }
        stage('checkout SCM')
        {
          steps{
              git 'https://github.com/rahuldevops1/devopsproject1-1.git' 
          }
        }
        stage('Build FrontEnd'){
            steps{
                
                sh 'npm install'
                sh 'npm build'
            }

        }
        stage('build backend')
        {
            steps{
                sh 'mvn package -DskipTests'
                archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
            }
        }
        stage('build image')
        {
            steps{

                sh 'docker image build . -t ${DOCKER_USER}/appLatest'
            }
        }
        
        stage('publish image')
        {
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                  sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}"
                  sh "docker image push ${DOCKER_USER}/appLatest"
            }
        
        }
    }
    
}