import artistsController from "./artists.controller.js";
import artistsTemplate from "./artists.html";

const artistsComponent = {
  controller: artistsController,
  template: artistsTemplate
};

angular.module("TunrApp").component("tunrArtists",   artistsComponent);
