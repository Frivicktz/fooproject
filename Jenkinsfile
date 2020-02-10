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
  }
 }