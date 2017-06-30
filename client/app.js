
const angular = require("angular");
require("angular-ui-router");

angular.module("TunrApp", ["ui.router"]).config(router);

router.$inject = ["$stateProvider", "$urlRouterProvider"];

function router ($stateProvider, $urlRouterProvider) {
  $stateProvider
    .state("home", {
      url: "/",
      template: "<tunr-artists></tunr-artists>"
    })
    .state("artist", {
      url: "/artist/:id",
      template: "<tunr-artist></tunr-artist>"
    })
    .state("newArtist", {
      url: "/artist/new",
      template: "<tunr-new-artist></tunr-new-artist>"
    });

  $urlRouterProvider.otherwise("/");
}
