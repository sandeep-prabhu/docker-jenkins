pipeline {
  environment {
    imagename = "sandeepsp21/mishi"
    registryCredential = 'sandeepsp21'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/sandeep-prabhu/docker-jenkins.git', branch: 'main', credentialsId: 'asassaas'])

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    stage ('Deploy to server') {
        steps {
            sh 'scp deploy.sh ${REMOTE_USER}@${REMOTE_HOST}:~/'
            sh 'ssh ${REMOTE_USER}@${REMOTE_HOST} "chmod +x deploy.sh"'
            sh 'ssh ${REMOTE_USER}@${REMOTE_HOST} ./deploy.sh'
        }
    }
  }
