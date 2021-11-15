const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-west-2:b18579b7-ef06-4d33-a64b-29d75e7fbfee",
                            "Region": "us-west-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-west-2_yZRdKMpQY",
                        "AppClientId": "g17h5mlu98ji3qsvavl6qfsg5",
                        "Region": "us-west-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "loginMechanisms": [
                            "PREFERRED_USERNAME"
                        ],
                        "signupAttributes": [
                            "ADDRESS",
                            "BIRTHDATE",
                            "EMAIL",
                            "FAMILY_NAME",
                            "MIDDLE_NAME",
                            "GENDER",
                            "LOCALE",
                            "GIVEN_NAME",
                            "NAME",
                            "NICKNAME",
                            "PHONE_NUMBER",
                            "PREFERRED_USERNAME",
                            "PICTURE",
                            "PROFILE",
                            "UPDATED_AT",
                            "WEBSITE",
                            "ZONEINFO"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": []
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                }
            }
        }
    }
}''';
