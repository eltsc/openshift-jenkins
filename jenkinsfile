pipeline {
    agnet {
        node { label 'kubeelad' }
        environment {
            JENKINS_URL = 'http://172.30.8.246:8080'
        }
        stage ('Get latest code') {
            steps {
                git branch: "master" , url: "https://gitlab.apps.bos.bynet.dev/elad/hello-world.git"
            }
        }
        stage ("Get info"){
            steps {
                sh '''
                pwd
                ls
                '''
            }
        }
        
     }
}