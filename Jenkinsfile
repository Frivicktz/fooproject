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
                bat "mvn compile"
            }
         }
    stage('Test') 
    {
        steps 
        {
             bat "mvn test"
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