import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl';

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["map"]

  connect() {
    mapboxgl.accessToken = 'pk.eyJ1IjoiZXZhcmxuZG4iLCJhIjoiY20zNWl2czg5MDlwdTJsc2Zmd3VoaGc4aCJ9.LpywPNFOCn0PX2qHkGpl1w'

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        const userLocation = [position.coords.longitude, position.coords.latitude];

        const map = new mapboxgl.Map({
          container: this.mapTarget,
          style: 'mapbox://styles/mapbox/streets-v11',
          center: userLocation,
          zoom: 15
        });

        new mapboxgl.Marker()
          .setLngLat(userLocation)
          .addTo(map);
      }, () => {
        alert('Error: The Geolocation service failed.');
      });
    } else {
      alert('Error: Your browser doesn\'t support geolocation.');
    }

  }
}
