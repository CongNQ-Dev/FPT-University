//Get the button

var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

var c = document.getElementById('canv'),
  $ = c.getContext('2d'),
  w = c.width = window.innerWidth,
  h = c.height = window.innerHeight,
  t = 0, num = 750, u=-15, _u, col,
  s, a, b, 
  x, y, _x, _y,
  _t = 1 / 60;

var anim = function() {
  $.globalCompositeOperation = 'source-over';
  $.fillStyle = 'hsla(0, 0%, 0%, .51)';
  $.fillRect(0, 0, w, h);
  $.globalCompositeOperation = 'lighter';
  for (var i = 0; i < 20; i++) {
    x = 0; x = 0; 
    $.beginPath();
    for (var j = 0; j < num; j++) {
      _u = (u/4)+i, col = u *(_u/4); 
      x += .5 * Math.sin(16);
      y = x * Math.sin(i + 15.4 * t + x /20) / 1.15;
      _x = x * Math.cos(i) + y * Math.sin(b);
      _y = x * Math.sin(i) + y * Math.cos(b);
      b = (j) * Math.PI /1.51;
      $.lineWidth = .05;
      $.lineTo(w / 2- _x, h / 2 -_y);
    }
 var g = $.createLinearGradient(w / 2 + _x, h / 2 + _y,  
            1, w / 2 + _x, h / 2 + _y);
    g.addColorStop(0.1, 'hsla('+col+',90%,50%,1)');
    g.addColorStop(0.5, 'hsla('+_u+',95%,50%,1)');
    g.addColorStop(1, 'hsla(0,0%,0%,1)'); 
    $.strokeStyle = g;
    $.stroke();
  }
  t += _t;
  u-=.2;
  window.requestAnimationFrame(anim);
};
anim();

window.addEventListener('resize', function() {
  c.width = w = window.innerWidth;
  c.height = h = window.innerHeight;
}, false);


