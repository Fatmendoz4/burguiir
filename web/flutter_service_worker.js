const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/": "index.html",
  "index.html": "index.html",
  "main.dart.js": "main.dart.js",
  "flutter.js": "flutter.js",
  "assets/AssetManifest.json": "assets/AssetManifest.json",
  "assets/FontManifest.json": "assets/FontManifest.json",
  "assets/NOTICES": "assets/NOTICES",
  // Aquí debes agregar todos los archivos relevantes de tu app (por ejemplo, iconos, imágenes, CSS)
};

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.filter((cacheName) => cacheName !== CACHE_NAME)
          .map((cacheName) => caches.delete(cacheName))
      );
    })
  );
});

self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request);
    })
  );
});
