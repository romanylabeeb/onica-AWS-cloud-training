const AWS = require('aws-sdk');
const codedeploy = new AWS.CodeDeploy();
exports.handler = function (event, context) {
    const key = event.Records[0].s3.object.key;
    const bucketName = event.Records[0].s3.bucket.name;

    console.log("Processing zip " + key + " in bucket " + bucketName);

    const applicationName = process.env.APP_NAME;
    const deploymentGroupName = process.env.DEPLOYMENT_group;
    const deploymentConfigName = 'CodeDeployDefault.OneAtATime';
    const fileExistsBehavior = 'OVERWRITE';

    const params = {
        applicationName: applicationName, /* required */
        deploymentGroupName: deploymentGroupName,
        fileExistsBehavior: fileExistsBehavior,
        deploymentConfigName: deploymentConfigName,
        ignoreApplicationStopFailures: false,
        autoRollbackConfiguration: { enabled: false },
        revision: {
            'revisionType': 'S3',
            's3Location': {
                'bucket': bucketName,
                'bundleType': 'zip',
                'key': key
            }
        },
    };
    console.log("Params2:", params);

    codedeploy.createDeployment(params, function (err, data) {
        if (err) {
            console.log(err, err.stack); // an error occurred
            context.console.error("Updated code for " + " lambda functions");
        }
        else {
            console.log(data);  
            sendSNSMSG()         // successful response
            context.succeed("Updated code for " + " lambda functions");
        }
    });


};

function sendSNSMSG(){
    var params = {
        Message: 'success send msg', /* required */
        TopicArn: process.env.TOPIC_ARN
      };
      console.log("sns params"+params)
      // Create promise and SNS service object
      var publishTextPromise = new AWS.SNS({apiVersion: '2010-03-31'}).publish(params).promise();
      
      // Handle promise's fulfilled/rejected states
      publishTextPromise.then(
        function(data) {
          console.log(`Message ${params.Message} send sent to the topic ${params.TopicArn}`);
          console.log("MessageID is " + data.MessageId);
        }).catch(
          function(err) {
          console.error(err, err.stack);
        });
}