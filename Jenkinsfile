pipeline {
    agent any

    environment {
        IMAGE_NAME = 'producto1-uoc'
        IMAGE_TAG = 'latest'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sergio-devops/devops-sergio.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'eval $(minikube -p minikube docker-env) && docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'kubectl get pods'
                sh 'kubectl get services'
            }
        }
    }

    post {
        success {
            echo 'Despliegue completado correctamente'
        }
        failure {
            echo 'Error en el pipeline'
        }
    }
}
