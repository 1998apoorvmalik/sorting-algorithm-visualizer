'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon%202.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "4d0ea861c79b029330b20ead9c96dabc",
"index.html": "26c6bcad6231499ace528fe355acc151",
"/": "26c6bcad6231499ace528fe355acc151",
"main.dart.js": "1e2433eeba61263b90cce637a2c76307",
"README.md": "4f2979078a35b98a6780e89fa22718cf",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192%202.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "dbf507340f8aab10dca2649ce64ecc7d",
".git/ORIG_HEAD": "64ad094986ae3445ab627889f82cd447",
".git/config": "ed019f0cc3b48c3346949cf2d569a2d0",
".git/objects/95/25fb84c34b8284113af656cf044c938e93f3d8": "4892d80c651a4295b34419ecf7fe55f9",
".git/objects/57/621ad61d276202c3e1b5259accfadfcd359dc8": "26a5365e95f0815ad7e455eec8d09a22",
".git/objects/03/25177083791f616ca3374593f9bed86759c5ad": "69f8589e82582d069ef31c8500f864cb",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "87850ce0a3dd72f458581004b58ac0d6",
".git/objects/32/46ad559eeae0370195978eaed83f1053ee13fd": "a043dbc0a0bda96ce2127799ccc27506",
".git/objects/56/cb34b7f8bb9dfda46cb113ab3ed7677518d641": "e428c355ab4ee88e955cdd6288a897d4",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/f3/5d454b244a2a72a1ad9a3c8f7c62a91e15721a": "52f837af61da757b9fc17e197f860f48",
".git/objects/20/5bb5db271c6d8de8399864c7bb9b917f638893": "c993b22f115d7f3ae6d5b7b212806539",
".git/objects/pack/pack-975b10208ee904d702afdbbc3f55f13daea1863c.pack": "88eaa5cc737cf216794c6d4246dba060",
".git/objects/pack/pack-975b10208ee904d702afdbbc3f55f13daea1863c.idx": "050d8ce28027a2187454aafc0c5052d0",
".git/objects/73/b19390e64d5748aff36e7278db670c5185cf72": "d6ed860fa0245af5e1063fc90205cb64",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/4c/bb009027e451e51517a33d061f17582e4ddf4a": "370f563326fade1e50d7da70236b0a2e",
".git/objects/4d/a5048d60bfa5e63a2bea26dbc7cbfb3644e2a9": "f6965fdd776bcc3634e1edd96e61be4a",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/96/bc1be0e11fb8c87c36d3ed045bb65ee0c2ef39": "2a3d7590f7b8b3210baf43ffe20e2f4d",
".git/objects/6d/1ee2846d109f2944da24735f13b88372559835": "a8a81988be58bfe124a2465b52667deb",
".git/objects/06/65a22406247bd621b30968b2ddf06d7e1bcc21": "4edd1b6cbcf134781c19e88bb1732da2",
".git/objects/6c/f03b5032667e47c02a77da9b487ea4876fbf86": "a69a41d6029aac4898ef56ae1e13bb34",
".git/objects/d3/df2a4757656790c9a3f6c406a695e2528ed599": "7cc0c798bb92e291aebfd5bfdc39ba0f",
".git/objects/d5/5a584432fd50552ca07bc637d24ebe10bb73d9": "16304a6279b7ac2484e39a4685753d49",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/beffd3ad4fe54d6cabccf83a05477d6a986cd0": "6677888e4a051c7838b5b240c09f0981",
".git/objects/b0/732f2047b838b28a909b94347de25bb18f6836": "8bef8a04b85b306e7271f813d0137b72",
".git/objects/b0/d409230674772fe54f82b6789aaeaed9245247": "deaef698d295b316cb312da450c2eafe",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/cd/c14a0aed23fd5e7920be237c57cc0205ab4c5b": "08b0da3153a02418577ad0e65b0b1970",
".git/objects/f6/3f23fce194dfada5f38affcaed7cb74401a333": "53b709a72a9ababe8db36fa53c2625a4",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/24/42f6d164669bf6d974506863b520be8fa40683": "ec2af3a05faabddb918c21e640b4c07e",
".git/objects/1d/905ff8a5952aae08547ce35a2cbbee4411f06d": "044b228e74f558512e6afd82cdb42417",
".git/objects/2b/cadd1eacdc3624895f763a6529b06cdcac9216": "557ad4d94769b224ed4221729d5376a7",
".git/objects/47/eb79f80ee72a16e4eaf74a9e0f560ba1f0d7d3": "84b7838a2ac2836885eb6526265c16a7",
".git/objects/13/86524b3244184dc42260d5f1881208b2f88fe8": "334a77d52d302f2d517216841a7c4bb1",
".git/objects/13/9340d07216c7906cb0610f9ec4c3f994d61a54": "835fa07e8cb680c5ff9bb4ce8bf5ac9d",
".git/HEAD": "14d13d5f2fc7beb4bbe4895397bb0ac0",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "61c6bd7f218c92b353f7b1f1bcb4d675",
".git/logs/refs/heads/web-app": "864e26a74330d1ffd70b2fdcbd4605aa",
".git/logs/refs/heads/webapp": "71136cdbdcae0776bf9814ea7366bcb0",
".git/logs/refs/remotes/origin/web-app": "89a9d066f2ccdd56674e182ef30fb8f6",
".git/logs/refs/remotes/origin/webapp": "bcd335214b8df12879f7c43b775afc3b",
".git/logs/refs/remotes/origin/main": "b2e0990e8c831431d93005a6dccb6a7b",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/update.sample": "7bf1fcc5f411e5ad68c59b68661660ed",
".git/refs/heads/web-app": "64ad094986ae3445ab627889f82cd447",
".git/refs/heads/webapp": "1db1884f259b11b74e027e90bfbdd921",
".git/refs/remotes/origin/web-app": "64ad094986ae3445ab627889f82cd447",
".git/refs/remotes/origin/webapp": "1db1884f259b11b74e027e90bfbdd921",
".git/refs/remotes/origin/main": "8b6e9e01821740ef1aa4ee3e141c1f7a",
".git/index": "d80a643cd035c640f9aa4ce38f98dafa",
".git/COMMIT_EDITMSG": "eb260e9ae827821beceeed4104f0ad89",
".git/FETCH_HEAD": "ae8d6fce46b0bbc27f69bb3c99c3d1eb",
"manifest%202.json": "dbf507340f8aab10dca2649ce64ecc7d",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/NOTICES": "2ba7803a121428186437a8fd4d6c380e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%202.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
