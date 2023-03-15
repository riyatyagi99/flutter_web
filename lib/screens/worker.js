var timer;

function startTimer() {
    timer = setInterval(function() {
        postMessage("tick");
    }, 1000);
}

function stopTimer() {
    clearInterval(timer);
}

self.onmessage = function(event) {
    if (event.data === "start") {
        startTimer();
    } else if (event.data === "stop") {
        stopTimer();
    }
};