pipeline {
  agent any
  environment {
    IMAGE = "simple-node-app:${env.BUILD_ID}"
    CONTAINER_NAME = "simple-node-app"
  }
  stages {
    stage('Checkout') {
      steps { checkout scm }
    }
    stage('Build Docker image') {
      steps {
        script {
          sh "docker build -t ${IMAGE} ."
        }
      }
    }
    stage('Stop old container') {
      steps {
        script {
          sh """
            if docker ps -q -f name=${CONTAINER_NAME} >/dev/null; then
              docker stop ${CONTAINER_NAME} || true
              docker rm ${CONTAINER_NAME} || true
            fi
          """
        }
      }
    }
    stage('Run container') {
      steps {
        script {
          // run detached, map host 8080 to container 8080
          sh "docker run -d --name ${CONTAINER_NAME} -p 8080:8080 -e COMMIT=${GIT_COMMIT ?: ''} ${IMAGE}"
        }
      }
    }
  }
  post {
    success { echo "Build and deploy successful" }
    failure { echo "Build failed" }
  }
}

