using scp.cloud from '../db/schema';

service IncidentService {
    entity Cities as projection on cloud.Cities;
}