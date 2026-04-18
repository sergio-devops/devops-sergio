pipeline {
    agent any

    stages {
        stage('Verificar repositorio') {
            steps {
                sh 'echo "Repositorio descargado correctamente"'
                sh 'ls -l'
            }
        }

        stage('Mostrar contenido web') {
            steps {
                sh 'echo "Contenido del archivo index.html:"'
                sh 'cat index.html'
            }
        }
    }
}
