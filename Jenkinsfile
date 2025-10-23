pipeline {
  agent any
  environment {
    IMAGE = "simple-node-app:${env.BUILD_ID}"
    CONTAINER_NAME = "simple-node-app"
    HOST_PORT = "8081"        // host port to avoid conflict with Jenkins UI on 8080
    CONTAINER_PORT = "8080"
  }
  stages {
    stage('Checkout') {
      steps {
        checkout scm
        // capture a short commit hash for later use
        script { env.COMMIT = sh(returnStdout: true, script: "git rev-parse --short HEAD").trim() }
      }
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
          // run detached, map host HOST_PORT to container CONTAINER_PORT
          sh "docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -e COMMIT=${env.COMMIT} ${IMAGE}"
        }
      }
    }
  }
  post {
    success { echo "Build and deploy successful — image: ${IMAGE}, commit: ${env.COMMIT}" }
    failure { echo "Build failed" }
  }
}
