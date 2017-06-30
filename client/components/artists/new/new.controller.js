NewArtistController.$inject = ["$stateParams", "artistsService"];
function NewArtistController($stateParams, artistsService){
  const vm = this;
  vm.artist = {};



  vm.saveArtist = function() {
    artistsService.saveArtist(newArtist).then(response => {
      vm.artist = response.artist;
    });
  }


}

export default NewArtistController;
