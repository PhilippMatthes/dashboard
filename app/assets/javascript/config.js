
class Location {
    constructor(name, longitude, latitude) {
        this.name = name;
        this.longitude = longitude;
        this.latitude = latitude;
    }
}

// TODO: Implement a better way of configuring the location
const config = {
    location: new Location('Dresden', 13.737262, 51.050407),
};
