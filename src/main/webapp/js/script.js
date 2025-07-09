$(document).ready(function () {

    const counterUp = window.counterUp.default;

const callback = entries => {
	entries.forEach( entry => {
		const el = entry.target
		if ( entry.isIntersecting && ! el.classList.contains( 'is-visible' ) ) {
			counterUp( el, {
				duration: 2000,
				delay: 16,
			} );
			el.classList.add( 'is-visible' );
		}
	} );
};

const IO = new IntersectionObserver( callback, { threshold: 1 } )

const el = document.querySelectorAll( '.counter' );

for (let count= 0; count < el.length; count++) {
IO.observe( el[count] );
}

$('.carousel').owlCarousel({
	items: 5,
	margin: 10,
	loop: true,
	nav: true,
	lazyLoad: true,
	autoplay: true,
	autoplayTimeout: 2000,
	autoplayHoverPause: true,
	responsive: {
	  0: {
		items: 1
	  },
	  768: {
		items: 2
	  },
	  992: {
		items: 3
	  },
	  1200: {
		items: 4
	  }
	}
  });

});