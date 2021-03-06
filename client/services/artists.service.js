artistsService.$inject = ["$http"];

function artistsService($http) {
  // console.log('service');
  const service = this;

  service.getArtists = function () {
    return $http.get("/artists").then(response => response.data);
  }

  service.getArtist = function (id) {
    return $http.get("/artists/" + id)
      .then(response => {
      return response.data;
    });
  };

  service.saveArtist = function(newArtist) {
    return $http.post("/artists", newArtist).then(response => {
      return response.data;
    })
  }

  // service.saveArtist = function (newArtist) {
  //   return $http.post("/artist", newArtist).then(response => {
  //     return response.data;
  //   });
  // };



  return service;
}

angular.module('TunrApp').service("artistsService", artistsService);
