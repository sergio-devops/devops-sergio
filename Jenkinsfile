pipeline {
    agent any

    environment {
        IMAGE_NAME = 'producto1-uoc'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh '''
                sudo -u ubuntu -H bash -lc '
                    cd /var/lib/jenkins/workspace/pipeline-go-devops
                    eval "$(minikube -p minikube docker-env)"
                    docker build -t '"${IMAGE_NAME}:${IMAGE_TAG}"' .
                '
                '''
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                sudo -u ubuntu -H bash -lc '
                    cd /var/lib/jenkins/workspace/pipeline-go-devops
                    kubectl apply -f deployment.yaml
                    kubectl apply -f service.yaml
                '
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                sudo -u ubuntu -H bash -lc '
                    kubectl get pods
                    kubectl get services
                '
                '''
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
