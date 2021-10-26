import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link"];

  connect() {
    //this.geolocate()
  }

  geolocate() {
    if (!navigator.geolocation) {
      this.linkTarget.textContent = "Geolocation is not supported in this browser.";
    } else {
      navigator.geolocation.getCurrentPosition(
        this.success.bind(this),
        this.error.bind(this)
      );
    }
  }

  success(position) {
    this.linkTarget.textContent = `Latitude: ${position.coords.latitude.toFixed(
      2
    )}, Longitude: ${position.coords.longitude.toFixed(2)}`;

    let latitude = position.coords.latitude;
    let longitude = position.coords.longitude;
    return [latitude, longitude];
  }

  error() {
    this.linkTarget.textContent = "Uh actually, maybe I don't.";
  }
}
