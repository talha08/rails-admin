/**
 * Created by talha on 1/21/2017.
 */
window.onload = function() {
    window.parent.postMessage({location:window.location.href}, "*");
};

