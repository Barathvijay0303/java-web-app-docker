node
{
   def buildNumber = BUILD_NUMBER
   stage("Git CheckOut"){
        git url: 'https://github.com/Barathvijay0303/java-web-app-docker.git',branch: 'master'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "Maven", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
    } 
   stage("Build Dokcer Image") {
         sh "docker build -t barathvijay/devops2021:${buildNumber} ."
    }
    stage("Docker login and Push"){
        withCredentials([string(credentialsId: 'docker_hub_password', variable: 'Dockerpassword')]){
         sh "docker login -u barathvijay -p ${Dockerpassword} " 
           }
        sh "docker push barathvijay/devops2021:${buildNumber}"
    }
    stage("Deploy to dockercontiner in docker deployer"){
        sshagent(['docker_ssh_password']) { 
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.87.142 docker rm -f kalaiyarkoil || true"
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.87.142 docker run -d -p 8080:8080 --name kalaiyarkoil barathvijay/devops2021:${buildNumber}" 
        }
    }  
}
