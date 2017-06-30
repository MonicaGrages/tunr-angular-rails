ArtistController.$inject = ["$stateParams", "artistsService"];
function ArtistController($stateParams, artistsService){
  const vm = this;

  activate();

  function activate(){
    artistsService.getArtist($stateParams.id).then(response => {
      vm.artist = response.artist;
      vm.songs = response.songs;
    });
  }


}

export default ArtistController;
