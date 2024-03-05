environment {
    CICD_GIT_REPO= sh (returnStdout: true, script: 'aws secretsmanager get-secret-value --secret-id jenkins-parameter | jq --raw-output .SecretString | jq -r ."CICD_GIT_REPO"').trim()
    CICD_GIT_BRANCH= sh (returnStdout: true, script: 'aws secretsmanager get-secret-value --secret-id jenkins-parameter | jq --raw-output .SecretString | jq -r ."CICD_GIT_BRANCH"').trim()
    CICD_CREDENTIALS_ID= sh (returnStdout: true, script: 'aws secretsmanager get-secret-value --secret-id jenkins-parameter | jq --raw-output .SecretString | jq -r ."CICD_CREDENTIALS_ID"').trim()
    FILENAME= sh (returnStdout: true, script: 'aws secretsmanager get-secret-value --secret-id jenkins-parameter | jq --raw-output .SecretString | jq -r ."FILENAME"').trim()
}

def jenkinsFile
stage('Loading Jenkinsfile...'){

  jenkinsFile = fileLoader.fromGit('Jenkinsfile', '${env.CICD_GIT_REPO}', '${env.CICD_GIT_BRANCH}', '${env.CICD_CREDENTIALS_ID}', '')
}
