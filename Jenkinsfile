pipeline {
    agent any

    tools {
        maven 'Maven-3'
    }

    stages {

        stage('Clear Maven Repo') {
            steps {
                sh "rm -rf /root/.m2/repository"
            }
        }

        stage('Build WAR') {
            steps {
                sh "mvn clean install"
            }
        }

        stage('Remove old WAR from Tomcat') {
            steps {
                sh "rm -rf /mnt/server/apache-tomcat-10.1.52/webapps/LoginWebApp*"
            }
        }

        stage('Create S3 bucket') {
            steps {
                sh "aws s3 mb s3://vel-bukt-345-123 || true"
            }
        }

        stage('Upload WAR to S3') {
            steps {
                sh "aws s3 cp target/LoginWebApp.war s3://vel-bukt-345-123/"
            }
        }

        stage('Deploy WAR to Tomcat') {
            steps {
                sh "aws s3 cp s3://vel-bukt-345-123/LoginWebApp.war /mnt/server/apache-tomcat-10.1.52/webapps/"
            }
        }
    }
}
