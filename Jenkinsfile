pipeline {
    agent any
    stages {
	
        stage('Clone GIT Repo') {
            steps {
                echo 'Cloning code from Github Repo'
				git branch: 'main', url: 'https://github.com/devopstraininghub/mindcircuit15d.git'
			
            }
        }
		
		 stage('Build Artifact') {
            steps {
                echo 'Building Artifact using maven build tool'
				sh 'mvn clean install'
				
            }
        }
		
	   stage('Deploy to Tomcat') {
            steps {
                echo 'Deploying artifact on to Tomcat'
				
				deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://ec2-54-163-200-96.compute-1.amazonaws.com:8081/')], contextPath: 'b15instagram', war: '**/*.war'
            }
        }
			
		
    }
}
