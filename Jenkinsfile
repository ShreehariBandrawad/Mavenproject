pipeline{
	agent any
	stages{
	    stage('clear local repository of maven'){
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
			sh "rm -rf /mnt/server/apache-tomcat-10.1.52/webapps/Loginwebapp*"
	             }
	    }

	    stage('Create S3 bucket'){
		steps{
			sh "aws s3 mb s3://vel-bukt-345-123"
		     }
           }
	  
	   stage('Copy .war to s3 bucket'){
                steps{
                        sh "aws s3 cp target/Loginwebapp.war s3://vel-bukt-345-123"
                     }
           }
		
	   stage('Deploy war file into tomcat server'){
                steps{
                        sh "aws s3://vel-bukt-345-123/Loginwebapp.war /mnt/server/apache-tomcat-10.1.52/webapps/ "
                     }
           }
	}
}
