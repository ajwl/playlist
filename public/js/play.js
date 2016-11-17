// MAKE THE CD PLAY

var CDAPP = (function(){

    //Grab src values from html to create Audio objects
    var audioElements = document.getElementsByTagName('audio'),
        audioSrcs = [],
        audioObjects = [],
        songElements = document.querySelectorAll('.song');

    console.log("this is" + audioElements);


    var getSources = function(el){
        for(var i=0; i<el.length; i++ ){
            audioSrcs.push(el[i].src);
        }
        console.log(audioSrcs);
        createAudioObjects(audioSrcs);
    };

    var createAudioObjects = function(sr){
        for(var i=0; i<sr.length; i++){
            audioObjects.push(new Audio(sr[i]));
        }
        console.log(audioObjects);
        return audioObjects
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

    var assignAction = function (e){

        console.log("here, e is this " + e.target);

        //Find audio file associated with event target

        var clickedElement = document.getElementById(e.target.id);

        console.log(clickedElement);

        var audioToPlay = clickedElement.getElementsByTagName('audio');

        console.log(audioToPlay);

        if(audioToPlay.paused === true){
            audioToPlay.play();
        }
        else{
            audioToPlay.pause();
        }

    };


    getSources(audioElements);
    attachEvent(songElements);


    //
    // if(audios.length === imgs.length){
    //     attachPlayEvent();
    // }
    // else {
    //     //Append an error message
    // }


})();

//CDAPP.init();




