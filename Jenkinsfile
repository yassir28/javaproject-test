pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    def version = readFile('VERSION')
                   // def versions = version.split('\\.')
                  //  def major = versions[0]
                  //  def minor = versions[0] + '.' + versions[1]
                    def patch = version.trim()
                    docker.withRegistry('', 'my-dockerhub-credentials') {
                        def image = docker.build('azujal/blog-docker-versioning:latest')
                        image.push()
                  //      image.push(major)
                    //    image.push(minor)
                        image.push(patch)
                    }
                }
            }
        }
    //  stage('Build') {
      //      steps {
                /*sh"sudo javac app.java"
                sh "java HelloWorld"*/
        //        sh "sudo docker build -t my-java-app:v1 ."
               // sh "sudo docker run --rm --name my-running-app my-java-app"

          //  }

        stage('Deploy to Kubernetes Cluster') {
            when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
              }
            }
            steps {
                //sh  'sudo kubectl run javapp --image=azujal/blog-docker-versioning:latest --port=80'
                kubernetesDeploy(credentialsType: 'KubeConfig', kubeconfigId: "mykubeconfig", configs:"file.yaml",  dockerCredentials: [[credentialsId: 'my-dockerhub-credentials']])
                //sh "sudo kubectl create -f file.yaml"
                        
            }
        }

    }
}