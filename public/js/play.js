// MAKE THE CD PLAY

var CDAPP = (function(){

    //Grab src values from html to create Audio objects
    var audioElements = document.getElementsByTagName('audio'),
        audioSrcs = [],
        audioObjects = [],
        songElements = document.querySelectorAll('.song');


    var getSources = function(el){
        for(var i=0; i<el.length; i++ ){
            audioSrcs.push(el[i].src);
        }
        createAudioObjects(audioSrcs);
    };


    var createAudioObjects = function(sr){
        for(var i=0; i<sr.length; i++){
            var a = new Audio(sr[i]);
            audioObjects.push(a);
        }
        return audioObjects;
    };


    var attachEvent = function(songBox){
        for(var i=0; i<songBox.length; i++){
            songBox[i].addEventListener(
                "click",
                assignAction,
                false
            );
        };
    };


    //Find audio object associated with event target
    var assignAction = function (e){

        var clickedId = e.currentTarget.id,
            clickedBox = document.getElementById(clickedId),
            clickedCd = clickedBox.getElementsByTagName('img')[0],
            audioToPlay = clickedBox.getElementsByTagName('audio')[0];

        if(audioToPlay.paused == true){
            audioToPlay.play();
            clickedCd.classList.add('spinning');
        }
        else if(audioToPlay.ended == true){
            clickedCd.classList.remove('spinning');
        }
        else {
            audioToPlay.pause();
            clickedCd.classList.remove('spinning');
        }
    };

    //Stop spinning after song ends
    for(var i=0; i<audioElements.length; i++) {
        audioElements[i].addEventListener(
            "ended",
            function () {
                this.nextElementSibling.classList.remove('spinning');
            },
            false);
    };


    getSources(audioElements);
    attachEvent(songElements);

})();





