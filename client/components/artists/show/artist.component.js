import artistController from "./artist.controller.js";
import artistTemplate from "./artist.html";

const artistComponent = {
  controller: artistController,
  template: artistTemplate
};

angular.module("TunrApp").component("tunrArtist",   artistComponent);
