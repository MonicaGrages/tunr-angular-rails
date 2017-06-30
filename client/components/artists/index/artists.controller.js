ArtistsController.$inject = ["artistsService"];
function ArtistsController(artistsService){
  const vm = this;

  activate();

  function activate(){
    artistsService.getArtists().then(response => {
      vm.artists = response;
    });
  }
}

export default ArtistsController;
