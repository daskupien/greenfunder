import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: "map",
    style: "mapbox://styles/jonnasson/ckm0fg0iz1sci17linzzr96nq",
    interactive: false,
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup({
      offset: [0, -20],
      closeButton: false,
      showCompass: false,
    }).setHTML(marker.infoWindow); // add this

    const element = document.createElement("div");
    element.className = "marker";
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = "contain";
    element.style.width = "30px";
    element.style.height = "30px";
    element.style.borderc = "1px solid green";

    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { zoom: 5, maxZoom: 10 });
};

const initMapbox = () => {
  const mapElement = document.getElementById("map");
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
