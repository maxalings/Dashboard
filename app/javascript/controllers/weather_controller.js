import { Controller } from '@hotwired/stimulus'

export default class extends Controller {

  static targets = ["icon", "temperature"]
  static values = {
    timezone: String
  }

  connect() {
    const API_KEY = "wuVpOQ0llQ9zEGWeChrbPCwGUdAyrVEB";
    const location = this.timezoneValue
    console.log(location)

    // const url = `http://dataservice.accuweather.com/locations/v1/cities/search?apikey=${API_KEY}&q=${location}`
    const url = `plceholder`
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        const LOCATION_KEY = `${data[0]["Key"]}`;
        fetch(`http://dataservice.accuweather.com/currentconditions/v1/${LOCATION_KEY}?apikey=${API_KEY}`)
        .then(response => response.json())
        .then((data) => {
          console.log(data)
          this.iconTarget.innerHTML = data[0]["WeatherText"]
          this.iconTarget.innerHTML += "oooo"
          this.temperatureTarget.innerHTML = Math.round(data[0]["Temperature"]["Metric"]["Value"])
        })
      })
      .catch(() => {
        const weatherText = `cloudy`
        const temperature = `28`
        // const weatherText = `${data[0]["WeatherText"]}`
        if (weatherText.includes("cloudy")){
          this.iconTarget.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-cloudy text-yellow-dark"><path d="M17.5 21H9a7 7 0 1 1 6.71-9h1.79a4.5 4.5 0 1 1 0 9Z"/><path d="M22 10a3 3 0 0 0-3-3h-2.207a5.502 5.502 0 0 0-10.702.5"/></svg>`;
        } else if (weatherText.toLowerCase().includes("sunny")) {
          this.iconTarget.innerHTML = `<i class="fa-solid fa-sun"></i>`;
        } else {
          this.iconTarget.innerHTML = `<i class="fa-solid fa-cloud-rain"></i>`;
        }
        this.temperatureTarget.innerHTML +=  `${temperature}°`;
      })

  }
}
