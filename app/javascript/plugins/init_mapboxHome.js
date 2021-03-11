import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: "map-home",
    style: "mapbox://styles/jonnasson/ckm0u49dl6zao17ryfls7n00o",
    interactive: false,
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const element = document.createElement("div");
    element.className = "markerhome";
    element.style.width = "20px";
    element.style.height = "20px";
    element.style.border = "0.1px solid";
    element.style.borderColor = "rgb(123 154 115)";
    element.style.borderRadius = "50%";
    element.style.backgroundColor = "#7fb742";
    element.style.opacity = "1.0";

    new mapboxgl.Marker(element).setLngLat([marker.lng, marker.lat]).addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { zoom: 4.2 });
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
