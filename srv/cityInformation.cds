using qpe.cloud from '../db/schema';

service CityService {
    entity Cities as projection on cloud.Cities;
}