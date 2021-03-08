import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: "map-home",
    style: "mapbox://styles/jonnasson/ckm0fg0iz1sci17linzzr96nq",
    interactive: true,
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
    element.style.borderColor = "#00bf7c";
    element.style.border = "0px solid";
    element.style.borderRadius = "50%";
    element.style.backgroundColor = "rgba(86, 130, 89, 0.8)";
    element.style.opacity = "0.5";

    // map.on("load", function () {
    //   map.addSource("markercircles", {
    //     type: "geojson",
    //     data: {
    //       type: "FeatureCollection",
    //       features: [
    //         {
    //           type: "Feature",
    //           geometry: {
    //             type: "Point",
    //             coordinates: [marker.lng, marker.lat],
    //           },
    //           properties: {
    //             modelId: 1,
    //           },
    //         },
    //       ],
    //     },
    //   });
    //   map.addLayer({
    //     id: "circles1",
    //     source: "markercircles",
    //     type: "circle",
    //     paint: {
    //       "circle-radius": 20,
    //       "circle-opacity": 0.5,
    //       "circle-color": "rgb(90, 207, 168)",
    //       "circle-stroke-width": 1,
    //       "circle-stroke-color": "#00bf7c",
    //       "circle-stroke-opacity": 1,
    //     },
    //     filter: ["==", "modelId", 1],
    //   });
    // });

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
