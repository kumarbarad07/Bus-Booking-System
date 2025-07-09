<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Project of Bus Reservation System">
    <meta name="keywords" content="Bus Reservation System Project">
    <title>Bus Booking</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Geologica:wght@100..900&display=swap');
    </style>
</head>

<body>

    <header>

        <section>
            <div class="banner">
                <nav
                    class="navbar navbar-expand-lg bg-body-tertiary  fixed-top justify-content-lg-evenly gradient-custom ">
                    <a href="#" class="navbar-brand "><img src="./Images/Illustration/Logo_bigtranz_1.png"
                            class="navbarlogo" alt=""></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarcontent" aria-controls="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse flex-grow-0" id="navbarcontent">
                        <ul class="navbar-nav gap-xl-3">
                            <li class="nav-item">
                                <a href="#" class="nav-link active text-uppercase text-warning"
                                    aria-current="page">Home</a>
                            </li>
                            <li class="nav-item">
                                <a href="aboutus.jsp" class="nav-link text-uppercase text-light">About US</a>
                            </li>
                            <li class="nav-item">
                                <a href="ourbuses.jsp" class="nav-link text-uppercase text-light">Our Buses</a>
                            </li>
                            <li class="nav-item">
                                <a href="busBooking.jsp" class="nav-link text-uppercase text-light">Bookings</a>
                            </li>
                            <li class="nav-item">
                                <a href="contactus.jsp" class="nav-link text-uppercase text-light">Contact Us</a>
                            </li>
                        </ul>
                    </div>

                    <div>
                    	<p></p>
                    	<a href="viewTicket.jsp" class="btn btn-outline-warning text-light">View Ticket</a>
                        <a href="index.jsp" class="btn btn-outline-secondary text-light">Logout</a>                        
                    </div>

                </nav>
            </div>
        </section>

    </header>

    <main>

        <section>
            <div class="hero-section gradient-custom pt-5">
                <div class="container-fluid mt-5 pt-5">
                    <div class="row">
                        <div class="col-xl-6 ps-xl-5">
                            <div class="h-text text-center text-xl-start">
                                <h2 class="text-capitalize text-light lh-1 geologica fw-bold charter-text p-2">Charter
                                    with us for an adventure-filled
                                    journey</h2>
                                <p class="text-light pt-2 pt-xl-3 p-3 p-xl-1 fs-5">Luctus nisi pharetra mollis aliquet
                                    iaculis tempus potenti.
                                    Dictumst vestibulum luctus eget sit sagittis et.</p>
                                <div class="text-xl-center">
                                    <button type="button"
                                        class="get-start border-0 rounded-2 fw-bold mt-xl-3 px-4 py-3"><i
                                            class="bi bi-arrow-up-right"></i> Get Started</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 p-0">
                            <div class="c-bus">
                                <img src="./Images/Illustration/Coach-Bus-mockup-04.png" class="coach-bus" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="container booking-box">
                <div class="row mb-5 shadow-lg m-2">
                    <div class="col-xl-4 p-0">
                        <div class="gradient-custom1 text-light callnow p-5">
                            <h3 class="geologica">Call Now !</h3>
                            <div class="d-flex mt-3">
                                <div>
                                    <div class="bg-warning text-center p-3">
                                        <i class="fa-solid fa-phone fa-xl" style="color: #000000;"></i>
                                    </div>
                                </div>
                                <div class="lh-1 ps-3">
                                    <p>Call for detail information</p>
                                    <p class="fs-2 fw-semibold">888-7007-235</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 bg-white">
                        <div class="p-3">
                            <div class="container">
                                <h3 class="text-primary">Online Booking</h3>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="m-2">
                                            <label for="selectdestination" class="form-label">From</label>
                                            <select id="selectdestination" class="form-select"
                                                aria-label="Default select example">
                                                <option selected>Destination</option>
                                                <option value="1">One</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="m-2">
                                            <label for="selectdestination" class="form-label">To</label>
                                            <select id="selectdestination" class="form-select"
                                                aria-label="Default select example">
                                                <option selected>Destination</option>
                                                <option value="1">One</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="m-2">
                                            <label for="date" class="form-label">Date</label><br>
                                            <input type="date" class="px-3 py-2 rounded-2 border border-opacity-25"
                                                name="" id="date" min="2025-02-14" max="2025-04-14">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="m-2">
                                            <label for="time" class="form-label">Time</label><br>
                                            <input type="time" class="form-control" value="10:05 AM" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="m-2">
                                            <label for="quantity" class="form-label">Seat</label><br>
                                            <input type="number" class="px-3 py-2 rounded-2 border border-opacity-25"
                                                name="" id="quantity">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="m-3">
                                            <a type="button"
                                                class="get-start border-0 fw-semibold mt-3 px-4 py-2 text-decoration-none text-black" href="busBooking.jsp"><i
                                                    class="fa-solid fa-bookmark me-2"></i>Book a Bus</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container pt-5 pb-5">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="p-3">
                            <h2 class="display-6 fw-bold text-primary pb-2">A bus rental that's affordable and
                                comfortable</h2>
                            <p class="text-secondary">Letius quis dui at lectus congue natoque et adipiscing curabitur
                                molestie. Mattis magnis mollis ultricies eros tortor vivamus venenatis. Mauris iaculis
                                amet porta lobortis dictum cubilia et ex.</p>
                            <div class="row p-2">
                                <div class="col-md-6">
                                    <div>
                                        <p class="text-warning display-3 fw-bold counter">25+</p>
                                        <p class="fs-5 fw-bold">Bus Ready</p>
                                        <p class="text-secondary">Sed nunc si consectetur convallis facilisis dictumst
                                            nibh.</p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div>
                                        <p class="text-warning display-3 fw-bold counter">97%</p>
                                        <p class="fs-5 fw-bold">Satisfied Customer</p>
                                        <p class="text-secondary">Sed nunc si consectetur convallis facilisis dictumst
                                            nibh.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div>
                            <div class="">
                                <img src="./Images/Illustration/smiling-woman-with-smartphone-at-bus-stop-in-london.jpg"
                                    class="img-fluid p-3" alt="smiling-women-with-smartphone">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container pt-5 pb-5">
                <div class="row">
                    <div class="col-xl-4">
                        <div class="text-xl-end text-center ps-xl-0">
                            <p class="text-uppercase fw-semibold">who we are</p>
                            <p class="text-primary display-5 fw-semibold geologica">Enjoy the journey – travel with us</p>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <div>
                            <p class="text-secondary px-xl-5">Dolor augue curae montes eget sollicitudin diam praesent
                                non mus in lobortis. Ligula
                                magna himenaeos dictumst cubilia dolor morbi letius tempor in convallis. Semper litora
                                suscipit facilisis scelerisque aenean rhoncus tempus mauris interdum dis parturient.
                                Ultrices feugiat adipiscing pharetra penatibus praesent non fusce ipsum class. Sociosqu
                                turpis scelerisque laoreet pulvinar fermentum posuere nam mollis porttitor convallis
                                dictumst.</p>
                        </div>
                    </div>
                </div>

                <!-- images of customers -->
                <div class="container pt-3 pb-5">
                    <div class="row">
                        <div class="col-md-4 px-0">
                            <div>
                                <img src="./Images/Illustration/female-passenger-using-public-transport-1.jpg"
                                    class="img-fluid" alt="">
                            </div>
                        </div>
                        <div class="col-md-4 px-0">
                            <div>
                                <img src="./Images/Illustration/woman-holding-digital-camera-and-looking-away-with-mixed-race-man-holding-map-near-travel-bus.jpg"
                                    class="img-fluid" alt="">
                            </div>
                        </div>
                        <div class="col-md-4 px-0">
                            <div>
                                <img src="./Images/Illustration/happy-young-friends-talking-while-sitting-in-city-bus.jpg"
                                    class="img-fluid" alt="">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="col-lg-2">
                            <div>
                                <p class="text-primary fs-4 fw-semibold text-center">As featured in : </p>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="carousel owl-carousel owl-theme">
                                <div>
                                    <img src="./Images/Illustration/Clients-1.png" class="img-fluid" alt="">
                                </div>
                                <div>
                                    <img src="./Images/Illustration/Clients-2.png" class="img-fluid" alt="">
                                </div>
                                <div>
                                    <img src="./Images/Illustration/Clients-3.png" class="img-fluid" alt="">
                                </div>
                                <div>
                                    <img src="./Images/Illustration/Clients-4.png" class="img-fluid" alt="">
                                </div>
                                <div>
                                    <img src="./Images/Illustration/Clients-5.png" class="img-fluid" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="transportation">
            <div class="group-transportation d-flex justify-content-center align-items-center">
                <div class="row justify-content-center text-center mx-0">
                    <div class="col-lg-7">
                        <div>
                            <p class="text-warning text-uppercase fw-bold">Premium bus charter</p>
                            <p class="text-capitalize text-light display-5 fw-bold geologica">Group transportation just got easier
                                with our bus rental</p>
                            <p class="text-light">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elis
                                tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>
                            <button type="button" class="fw-semibold get-start border-0 px-4 py-2 mt-3">Discover
                                More</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section>
            <div class="riding-safety d-flex justify-content-center align-items-center">
                <div class="container">
                    <div class="row mx-0">
                        <div class="col-lg-6 col-xl-6">
                            <div>
                                <p class="text-warning text-uppercase fw-bold">why choose us</p>
                                <p class="text-white display-5 fw-semibold ">Riding with us, your satisfaction is
                                    guaranteed!</p>
                                <p class="text-white fw-semibold">Streamlining your travel experience, from start to
                                    finish.</p>
                            </div>
                            <div class="mt-4">
                                <div class="row p-3 row-gap-3">
                                    <div class="col-md-6">
                                        <div class="d-flex gap-3">
                                            <div>
                                                <i class="fa-solid fa-square-check fa-2xl" style="color: #ffc800;"></i>
                                            </div>
                                            <div>
                                                <p class="text-white fs-5 fw-bold">Safety & Security</p>
                                                <p class="text-white fw-semibold">Trust in our system for a safe and
                                                    secure journey every time.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex gap-3">
                                            <div>
                                                <i class="fa-solid fa-square-check fa-2xl" style="color: #ffc800;"></i>
                                            </div>
                                            <div>
                                                <p class="text-white fs-5 fw-bold">On Time & Punctual</p>
                                                <p class="text-white fw-semibold">On time, every time – your journey
                                                    begins with punctuality.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex gap-3">
                                            <div>
                                                <i class="fa-solid fa-square-check fa-2xl" style="color: #ffc800;"></i>
                                            </div>
                                            <div>
                                                <p class="text-white fs-5 fw-bold">Professional Drivers</p>
                                                <p class="text-white fw-semibold">The road to a great journey is paved
                                                    with professional drivers.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex gap-3">
                                            <div>
                                                <i class="fa-solid fa-square-check fa-2xl" style="color: #ffc800;"></i>
                                            </div>
                                            <div>
                                                <p class="text-white fs-5 fw-bold">Well Maintenance</p>
                                                <p class="text-white fw-semibold">A smooth ride starts with
                                                    well-maintained buses that you can trust.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="pt-5 pb-3">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="text-center p-5">
                            <p class="text-uppercase fw-semibold">How it works</p>
                            <p class="text-capitalize display-5 fw-bold step">4 steps to booking our bus</p>
                            <p class="text-secondary fw-semibold pt-3">Lorem ipsum dolor sit amet, consectetur
                                adipiscing elit. Ut elit
                                tellus,
                                luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>
                        </div>
                    </div>
                </div>
                <div class="row pt-3 text-center">
                    <div class="col-md-6 col-xl-3">
                        <div class="steps shadow p-3 gradient-custom2">
                            <img src="./Images/Illustration/circle-1.png" class="pb-3" alt="">
                            <p class="text-capitalize text-white fs-4 fw-semibold">Select your bus</p>
                            <p class="text-warning">The road to a great trip starts with the right bus. Pick yours
                                today!</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <div class="steps shadow p-3">
                            <img src="./Images/Illustration/circle-2.png" class="pb-3" alt="">
                            <p class="text-capitalize fs-4 fw-semibold">Booking & Confirmed</p>
                            <p class="steps-p">If you Confirmed your seat, your seat will be fixed.</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <div class="steps shadow p-3">
                            <img src="./Images/Illustration/circle-3.png" class="pb-3" alt="">
                            <p class="text-capitalize fs-4 fw-semibold">Booking Payment</p>
                            <p class="steps-p">Complete your payment to finalize your seat reservation!</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <div class="steps shadow p-3">
                            <img src="./Images/Illustration/circle-4.png" class="pb-3" alt="">
                            <p class="text-capitalize fs-4 fw-semibold">Start Your roadtrip</p>
                            <p class="steps-p">Life’s a journey, not a destination. Let’s make every mile count!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>


    </main>

    <footer>

        <section class="footer-section align-content-md-center">
            <div class="container">
                <div class="row text-white">
                    <div class="col-12 col-xl-3">
                        <div>
                            <img src="./Images/Illustration/Logo_bigtranz_1.png" class="footer-logo" alt="">
                            <p class="mt-4 mb-5">From booking to destination, we’re committed to your comfort and safety</p>
                            <a class="bg-warning text-dark text-decoration-none px-3 py-3"><i class="fa-solid fa-phone fa-xl" style="color: #000000;"></i> 888-7007-235</a>
                            
                        </div>
                    </div>
                    <div class="col-6 col-md-4 col-xl-3 mt-4 mt-md-5 mt-xl-0">
                        <div class="ps-lg-5">
                            <p class="">Company</p>
                            <ul class="lh-lg ps-0">
                                <li>
                                    <a href="" class="footer-list">About Us</a>
                                </li>
                                <li>
                                    <a href="" class="footer-list">Our Bus</a>
                                </li>
                                <li>
                                    <a href="" class="footer-list">Destinations</a>
                                </li>
                                <li>
                                    <a href="" class="footer-list">Rate Chart</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-6 col-md-4 col-xl-3 mt-4 mt-md-5 mt-xl-0">
                        <div class="ps-lg-5">
                            <p>Services</p>
                            <ul class="lh-lg ps-0">
                                <li>Safety Guarantee</li>
                                <li>Schedule on Time</li>
                                <li>Online Booking</li>
                                <li>Professional Staff</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-xl-3 mt-3 mt-md-5 mt-xl-0">
                        <div class="ps-lg-5">
                            <p>Get in touch</p>
                            <ul class="lh-lg ps-0">
                                <li><i class="fa-solid fa-location-dot pe-3" style="color: #ff9f06;"></i> 139,Indiranagar,Pune.</li>
                                <li><i class="fa-solid fa-envelope pe-3" style="color: #ff9f06;"></i><a href="mailto:email@example.com" class="footer-list">bustranz31@gmail.com</a></li>
                                <li><i class="fa-solid fa-phone pe-3" style="color: #ff9f06;"></i><a href="tel:+1-234-567-890" class="footer-list">+9823459011</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </footer>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/counterup2/2.0.2/index.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="./js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>