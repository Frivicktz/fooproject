pipeline
{
    agent any
    stages 
    {
    stage('Checkout') 
        {
        steps 
            {
                cleanWs()

                 git 'https://github.com/Frivicktz/fooproject'
            }
        }
    stage('Build') 
        {
        steps 
            {
                sh "mvn compile"
            }
         }
    stage('Test') 
    {
        steps 
        {
             sh "mvn test"
        }
        post 
        {
             always 
        {
        junit '**/TEST*.xml'
        }
        }
   }
     stage('newman') 
     {
         steps 
         {
             sh 'newman run Restful_Booker.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'
         }
         post 
         {
                always 
                    {
                        junit '**/*xml'
                    }
             }
        }
        
        stage('robot') {
            steps {
                sh 'robot -d results --variable BROWSER:headlesschrome carRental.robot'
            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput: false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                           )
                    }
                }
            }
        }
  }
 }
