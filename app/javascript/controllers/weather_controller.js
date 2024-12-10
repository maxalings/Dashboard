import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  static targets = ["location", "bidget", "midget"]

  connect() {
  }

  submitForm(event){
    event.preventDefault()

    const API_KEY = "wuVpOQ0llQ9zEGWeChrbPCwGUdAyrVEB";
    const location = this.locationTarget.value

    fetch(`http://dataservice.accuweather.com/locations/v1/cities/search?apikey=${API_KEY}&q=${location}`)
      .then(response => response.json())
      .then((data) => {
        const LOCATION_KEY = `${data[0]["Key"]}`;
        fetch(`http://dataservice.accuweather.com/currentconditions/v1/${LOCATION_KEY}?apikey=${API_KEY}`)
        .then(response => response.json())
        .then((data) => {
          console.log(data[0]["WeatherText"])
          console.log(data[0]["Temperature"]["Metric"]["Value"])
          this.bidgetTarget.innerHTML = `${data[0]["WeatherText"]}`
        })
      })

  }
}
