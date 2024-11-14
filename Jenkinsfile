@Library("Shared") _
pipeline {
    agent { label "vinod" }
    
    stages{
        
        stage("Hello"){
            steps{
                script{
                    hello()
                }
            }
            
        }
        stage("code"){
            steps{
             script{
             clone("https://github.com/Mp886/django-notes-app.git","main")    
            }
        }
            
    }
        stage("Build"){
            steps{
                echo "This is building the code"
                sh "docker build -t notes-app:latest ."
            }
        }
        stage("Push to Docker Hub"){
            steps{
                echo "Pushing the image to Dockerhub"
                withCredentials([usernamePassword('credentialsId':"dockerHubCred",
                passwordVariable:"dockerHubPass", 
                usernameVariable:"dockerHubUser")]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker image tag notes-app:latest ${env.dockerHubUser}/notes-app:latest"
                sh "docker push ${env.dockerHubUser}/notes-app:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
                echo "This is deploying the code"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
    
}
