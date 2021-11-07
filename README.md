# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch` 
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).

## Deployment to Cloud Foundry
- Create a HANA instance in your trial account
- Install service push: `cf install-plugin Create-Service-Push` 
- Build the application using CDS: `cds build --production`
- Deploy the application to cloud Foundry: `cf create-service-push`
- This will create an HDI Container called mytimes-db as well as a service mytimes-srv
- Access mytimes-srv from the BTP Cockpit

## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.
