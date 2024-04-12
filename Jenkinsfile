pipeline {
    agent { label "dev-server"}
    
    stages {
        
        stage("code"){
            steps{
                git "https://github.com/ajayhp07/Website.git"
            }
        }
        stage("build and test"){
            steps{
                sh "docker build -t bioam_website ."
            }
        }
        stage("scan image"){
            steps{
                echo 'image sccaning ho gya'
            }
        }
        stage("push"){
            steps{
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker tag node-app-test-new:latest ${env.dockerHubUser}/node-app-test-new:latest"
                sh "docker push ${env.dockerHubUser}/bioam_website"

                }
            }
        }
        stage("deploy"){
            steps{
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
