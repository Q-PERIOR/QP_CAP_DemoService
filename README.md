# Getting Started

This application is a Demo CAP Service which serves data from CSV files as an OData Service. The service is designed to contain no specific logic, hence all implementation is reusable and is the basis for any application that needs an OData-Service. Further, this CAP service is deployable to SAP BTP as a SAP HANA Service.  

The project follows the recommended layout and contains these folders and files:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Clone the repository to your favorite IDE (Business Application Studio or VS Code)
- Run `npm install`
- Open a new terminal and run `cds watch` 
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).

## Deployment to Cloud Foundry
Before you start to deploy the application to SAP BTP, you need to add the following cds deploy config to `package.json`. Note, if you want to run the application locally afterwards, just comment config line `"kind": "hana"`.
```
    "cds": {
        "requires": {
            "db": {
                "kind": "hana"
            }
        },
        "hana": {
            "deploy-format": "hdbtable"
        },
        "features": {
            "fiori_preview": true
        }
    }
```

Afterwards, follow these steps:
- Create a HANA instance in your trial account
- Install service push: `cf install-plugin Create-Service-Push` 
- Build the application using CDS: `cds build --production`
- Deploy the application to cloud Foundry: `cf create-service-push`
- This will create an HDI Container called mycity-db as well as a service mycity-srv
- Access mycity-srv from the BTP Cockpit

## Local enhancement of the Demo Service
This section explains how to customize the OData-Service to fit your requirement.

### Create a new entity
To create a new Entity, go to [db/schema.cds](db/schema.cds) and append a new entity to the file. An example for the entity `Cities` is given below.
```
entity Cities : cuid, {
    city                  : String(100)          @title : 'City';
    inhabitants           : String(100)          @title : 'Inhabitants';
    state                 : String(100)          @title : 'State';
}
```

### Provide data for an entity
To provide data for the entity, create a new CSV file within folder [db/data](db/data). The filename of the CSV must have the namespace and the exact name of the entity. The content of the CSV file starts with a header line. Afterwards all data records are written done line by line. Pay attention, the CUID field within in the entity definition represents the field ID in the CSV data file.

```
ID;city;inhabitants;state
1;Berlin;3600000;Berlin
2;Hamburg;1800000;Hamburg
```
### Publish the OData service
The service definition is done within [srv/cityInformation.cds](srv/cityInformation.cds). You can rename the OData Service from here or add new entities to the service. Please see the example below.
```
service IncidentService {
    entity Cities as projection on cloud.Cities;
}
```

## Publish a common 
If you have enhancements to the service which will be generally needed, you can publish it to others. In this case, create a new git branch and push it to the GitHub. Afterwards create a Pull Request. The pull request will be reviewed and merged by the application owner.

## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.
