pipeline{
        agent any
        stages{
            stage('clear local repository of mvn'){
                steps{
                        sh "rm -rf /root/.m2/repository"
                     }
            }

            stage('Maven clean install'){
                steps{
                        sh "mvn clean install"
                     }
            }

            stage('remove .war file from tomcat deployment folder'){
                steps{
                        sh "rm -rf /mnt/server/apache-tomcat-10.1.52/webapps/LoginWebApp*"
                     }
            }

            stage('Create S3 bucket'){
                steps{
                        sh "aws s3 mb s3://velocity-bukt-345-123sss"
                     }
           }

           stage('Copy .war to s3 bucket'){
                steps{
                        sh "aws s3 cp /mnt/Mavenproject/target/LoginWebApp.war s3://velocity-bukt-345-123sss "
                     }
           }

            stage('Deploy war file into tomcat server'){
                steps{
                        sh "aws s3://velocity-bukt-345-123sss/LoginWebApp.war  /mnt/server/apache-tomcat-10.1.52/webapps/ "
                     }
           }
        }
}

            
            
