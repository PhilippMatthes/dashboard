
class Location {
  constructor(name, longitude, latitude) {
    this.name = name;
    this.longitude = longitude;
    this.latitude = latitude;
  }
}

const config = {
  location: new Location('Dresden', 13.737262, 51.050407),
  momentCalendarFormat: {
    sameDay: '[Today] HH:mm',
    nextDay: '[Tomorrow] HH:mm',
    nextWeek: 'dddd',
    lastDay: '[Yesterday] HH:mm',
    lastWeek: '[Last] dddd',
    sameElse: 'DD/MM/YYYY'
  },
};
