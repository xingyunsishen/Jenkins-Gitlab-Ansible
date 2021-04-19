#!groovy

pipeline {
    agent {node {label 'master'}}

    environment {
        PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin"
    }

    parameters {
        choice(
            choices: 'dev\nprod',
            description: 'choose deploy environment',
            name: 'deploy_env'
            )
        string (name: 'version', defaultValue: '1.0.0', description: 'build version')
    }

    stages {
        stage("Checkout test repo") {
            steps{
                sh 'git config --global http.sslVerify false'
                dir ("${env.WORKSPACE}") {
                    git branch: 'master', credentialsId:"9aa11671-aab9-47c7-a5e1-a4be146bd587", url: 'https://root@gitlab.example.com/root/test-repo.git'
                }
            }
        }
        stage("Print env variable") {
            steps {
                dir ("${env.WORKSPACE}") {
                    sh """
                    echo "[INFO] Print env variable"
                    echo "Current deployment environment is $deploy_env" >> test.properties
                    echo "The build is $version" >> test.properties
                    echo "[INFO] Done..."
                    """
                }
            }
        }
        stage("Check test properties") {
            steps{
                dir ("${env.WORKSPACE}") {
                    sh """
                    echo "[INFO] Check test properties"
                    if [ -s test.properties ]
                    then 
                        cat test.properties
                        echo "[INFO] Done..."
                    else
                        echo "test.properties is empty"
                    fi
                    """

                    echo "[INFO] Build finished..."
                }
            }
        }
    }
}