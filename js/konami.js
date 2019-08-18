var ctx, canvas;
var x = [];
var y = [];
var dx = [];
var dy = [];
var colors = []

function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

function init() {
    canvas = document.getElementById("canvas");
    if (canvas == null) {
        // Create a new canvas object
        canvas = document.createElement("canvas");
        document.body.appendChild(canvas);

        // Configure the positions and sizes
        canvas.style.position = 'absolute';
        canvas.style.left="0px";
        canvas.style.top="0px";
        canvas.width=window.innerWidth;
        canvas.height=window.innerHeight;
    }
    ctx = canvas.getContext("2d");
    for (i = 0; i < 20; i++)
    {
        colors.push(getRandomColor());
        x.push(Math.round(Math.random() * canvas.width));
        y.push(Math.round(Math.random() * canvas.height));
        dx.push(5 * 2 * (Math.round(Math.random()) - 0.5));
        dy.push(5 * 2 * (Math.round(Math.random()) - 0.5));
    }
    setInterval(draw, 10);
    canvas.style.visibility = 'hidden';
}

function toggleCanvas() {
    if (canvas == null) {
        init();
    }
    if (canvas.style.visibility === 'hidden') {
        canvas.style.visibility = 'visible';
    }
    else {
        canvas.style.visibility = 'hidden';
    }
}

function draw() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    for (i = 0; i < 20; i++) {
        ctx.beginPath();
        ctx.fillStyle=colors[i];
        if (x[i] >= canvas.width || x[i] <= 0) {
            dx[i] = -dx[i];
        }
        if (y[i] >= canvas.height || y[i] <= 0) {
            dy[i] = -dy[i];
        }
        ctx.arc(x[i], y[i], 20, 0, Math.PI*2, true);
        ctx.closePath();
        ctx.fill();
        x[i]+=dx[i];
        y[i]+=dy[i];
    }
}

function onKonamiCode(cb) {
    var input = '';
    var key = '38384040373937396665';
    document.addEventListener('keydown', function (e) {
        input += ("" + e.keyCode);
        if (input === key) {
            return cb();
        }
        if (!key.indexOf(input)) return;
        input = e.keyCode == '38' ? '3838' : ('' + e.keyCode);
    });
}

onKonamiCode(function() {toggleCanvas()});