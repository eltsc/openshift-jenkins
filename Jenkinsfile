pipeline {
    agent {
        label 'kubegolang' 
    }
        
        environment {
            JENKINS_URL = 'http://172.30.8.246:8080'
            // GOPATH = '${env.WORKSPACE}/go'
            // GOROOT = '${root}'
            // GOBIN = '${root}/bin'
            // // PATH+GO = '${root}/bin'
        }
    stages{
        stage ('Get latest code') {
            steps {
                git branch: "dev" , url: "https://gitlab.apps.bos.bynet.dev/elad/hello-world.git"
            }
        }
        stage ("Get info"){
            steps {
                sh '''
                pwd
                ls 
                go version
                '''
            }           
        }
        stage ("Build"){
            steps {
                sh "go build ./hello.go; ls"
            }           
        }
        stage ("Deploy"){
            steps {
                withCredentials([usernamePassword(credentialsId: 'git-pass-credentials-ID', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    sh('git config --global user.email "elad@aaa.com"')
                    sh('git config --global user.name "elad"')
                    // sh("git tag -a some_tag -m 'Jenkins'")
                    // sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@gitlab.apps.bos.bynet.dev/elad/hello-world.git --tags')
                    sh("git add *")
                    sh("git commit -m 'build'")
                    sh("git checkout master")
                    sh("git merge dev")
                    sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@gitlab.apps.bos.bynet.dev/elad/hello-world.git')

                }          
            }           
        }

    }
}