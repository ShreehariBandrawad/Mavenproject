pipeline {
    agent {
        label 'built-in'
    }

    tools {
        maven 'apache-maven-3.9.15'
    }

    stages {

        stage('checkout code') {
            steps {
                git 'https://github.com/ShreehariBandrawad/Mavenproject.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('save Artifacts') {
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

        stage('Deploy to slave') {
            steps {
                sh '''
                scp target/*.war root@172.31.29.47:/mnt/servers/apache-tomcat-10.1.54/webapps
                '''
            }
        }
    }
}
