import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: "map-home",
    style: "mapbox://styles/jonnasson/ckm0fg0iz1sci17linzzr96nq",
    interactive: false,
    // center: [50, 48],
    // zoom: 3,
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    // const popup = new mapboxgl.Popup({
    //   offset: [0, 0],
    //   closeButton: false,
    //   showCompass: false,
    // }).setHTML(marker.infoWindow); // add this

    const element = document.createElement("div");
    element.className = "marker";
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = "contain";
    element.style.width = "30px";
    element.style.height = "30px";

    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      // .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 60, zoom: 4.2, maxZoom: 15 });
};

const initMapboxHome = () => {
  const mapElement = document.getElementById("map-home");
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapboxHome };
