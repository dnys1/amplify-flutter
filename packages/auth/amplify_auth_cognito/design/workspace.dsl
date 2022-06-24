workspace {

    model {
        user = person "User"
        authPlugin = softwareSystem "Cognito Auth Plugin" {
            !docs docs
            stateMachine = container "State Machine"
            hostedUI = container "Hosted UI"
        }

        user -> authPlugin "addPlugin"
        user -> hostedUI "Interacts with platform components"
    }

    views {
        systemContext authPlugin "AuthPlugin" {
            include *
            autolayout
        }

        container hostedUI "HostedUI" {
            include *
            autolayout
        }

        theme default
    }

}
