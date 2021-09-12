if(location.pathname == "/users") {
  $(function () {
    let allCards = document.querySelectorAll('.swipe--card');

    let swipeContainer = document.querySelector('.swipe');

    function initCards() {
      let newCards = document.querySelectorAll('.swipe--card:not(.removed)'
      
      newCards.forEach(function (card, index) {
        card.style.zIndex = allCards.length - index;
        card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
        card.style.opacity = (10 - index) / 10;
      });
    }

    initCards();

    allCards.forEach(function (el) {
      let hammertime = new Hammer(el);

      hammertime.on('pan', function (event) {
        if (event.deltaX === 0) return;
        if (event.center.x === 0 && event.center.y === 0) return;

        el.classList.add('moving');

        swipeContainer.classList.toggle('swipe_like', event.deltaX > 0);
        swipeContainer.classList.toggle('swipe_dislike', event.deltaX < 0);

        let xMulti = event.deltaX * 0.03;
        let yMulti = event.deltaY / 80;
        let rotate = xMulti * yMulti;

        event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)';
      });
      hammertime.on('panend', function (event) {
        el.classList.remove('moving');
        swipeContainer.classList.remove('swipe_like');
        swipeContainer.classList.remove('swipe_dislike');

        let moveOutWidth = document.body.clientWidth;

        let keep = Math.abs(event.deltaX) < 200
        event.target.classList.toggle('removed', !keep);

        if (keep) {
          event.target.style.transform = '';
        } else {
          let endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth) + 100;
          let toX = event.deltaX > 0 ? endX : -endX;
          let endY = Math.abs(event.velocityY) * moveOutWidth;
          let toY = event.deltaY > 0 ? endY : -endY;
          let xMulti = event.deltaX * 0.03;
          let yMulti = event.deltaY / 80;
          let rotate = xMulti * yMulti;

          event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)';

          initCards();
        }
      });
    });

  });
}