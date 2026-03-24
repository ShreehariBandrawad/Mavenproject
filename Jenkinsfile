pipeline{
	agent any
	
	tool{
		maven 'Maven-3'
    }
	stages{
	    stage('clear local repository of maven'){
		steps{
			sh "rm -rf /root/.m2/repository"
		     }
	    }
	    
	    stage('mvn clean install'){
                steps{
                        sh "mvn clean install"
                     }
            }
	
	    stage('remove .war file from tomcat deployment folder'){
		steps{
			sh "rm -rf /mnt/server/apache-tomcat-10.1.52/webapps/LoginWebapp*"
	             }
	    }

	    stage('Create S3 bucket'){
		steps{
			sh "aws s3 mb s3://vel-bukt-345-123"
		     }
           }
	  
	   stage('Copy .war to s3 bucket'){
                steps{
                        sh "aws s3 cp /mnt/Mavenproject/target/LoginWebapp.war s3://vel-bukt-345-123"
                     }
           }
		
	   stage('Deploy war file into tomcat server'){
                steps{
                        sh "aws s3 cp s3://vel-bukt-345-123/LoginWebapp.war /mnt/server/apache-tomcat-10.1.52/webapps/ "
                     }
           }
	}
}
