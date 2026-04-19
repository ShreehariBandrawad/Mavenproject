pipeline {
    agent {
        label 'built-in'
    }

    tools {
        maven 'apache-maven-3.9.15'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/ShreehariBandrawad/Mavenproject.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Save Artifacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }

        stage('Setup DB') {
            steps {
                sh '''
                chmod +x setup-db.sh
                ./setup-db.sh
                '''
            }
        }

        stage('Deploy to Server') {
            steps {
                sh '''
                scp -o StrictHostKeyChecking=no target/LoginWebApp.war root@18.216.27.237:/mnt/servers/apache-tomcat-10.1.54/webapps
                '''
            }
        }
    }
}
