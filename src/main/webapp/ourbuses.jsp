<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Project of Bus Reservation System">
    <meta name="keywords" content="Bus Reservation System Project">
    <title>Our Buses</title>
    <link rel="stylesheet" href="./css/busessstyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Geologica:wght@100..900&display=swap');
    </style>
</head>

<body>

    <header>
        <section class="mb-5 pb-5">
            <div class="banner">
                <nav
                    class="navbar navbar-expand-lg bg-body-tertiary fixed-top justify-content-lg-evenly shadow gradient-custom">
                    <a href="#" class="navbar-brand "><img src="./Images/Illustration/Logo_bigtranz_1.png"
                            class="navbarlogo" alt=""></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarcontent" aria-controls="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse flex-grow-0" id="navbarcontent">
                        <ul class="navbar-nav gap-xl-3">
                            <li class="nav-item">
                                <a href="index.jsp" class="nav-link text-uppercase text-light">Home</a>
                            </li>
                            <li class="nav-item">
                                <a href="aboutus.jsp" class="nav-link text-uppercase text-light">About US</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link active text-uppercase text-warning" aria-current="page">Our
                                    Buses</a>
                            </li>
                            <li class="nav-item">
    							<a href="<%= session.getAttribute("username") != null ? "busBooking.jsp" : "login.jsp" %>" class="nav-link text-uppercase text-light">Bookings</a>
							</li>
                            <li class="nav-item">
                                <a href="contactus.jsp" class="nav-link text-uppercase text-light">Contact Us</a>
                            </li>
                        </ul>
                    </div>
                    
                    <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
    %>
        <div>
            <a href="login.jsp" class="btn btn-outline-secondary text-light">Login</a>
            <a href="signup.jsp" class="btn btn-outline-primary text-light">SignUp</a>
        </div>
    <%
        } else {
    %>
        <div>
            <a href="viewTicket.jsp" class="btn btn-outline-warning text-light me-2">View Ticket</a>
            <a href="logout.jsp" class="btn btn-outline-danger text-light">Logout</a>
        </div>
    <%
        }
    %>

                </nav>
            </div>
        </section>
    </header>


    <main>

        <section>
            <div class="container">
                <div class="row p-3">
                    <div class="col-md-4">
                        <div>
                            <p class="text-uppercase fs-5 fw-bold">Our Quality buses</p>
                            <p class="display-5 bus-quote fw-bold">Get on the road with our bus</p>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div>
                            <p class="text-secondary fs-5 mt-4">Every time you step onto one of our buses, you're
                                choosing not
                                just a ride, but an experience designed to provide ultimate comfort, punctuality, and
                                peace of mind, with our state-of-the-art buses and professional service team working
                                together to deliver a first-class journey from start to finish.</p>
                        </div>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-xl-4">
                        <div>
                            <figure class="shadow" data-aos="zoom-in" data-aos-duration="1000">
                                <img src="./Images/Illustration/bus-1.jpg" class="img-fluid rounded-2 setra" alt="">
                                <figcaption class="p-3">
                                    <p class="bus-quote display-6 fw-bold">Setra Bus</p>
                                    <p><i class="fa-solid fa-star" style="color: #FFD43B;"></i><i class="fa-solid fa-star"
                                        style="color: #FFD43B;"></i><i class="fa-solid fa-star"
                                        style="color: #FFD43B;"></i><i class="fa-solid fa-star"
                                        style="color: #FFD43B;"></i><i class="fa-solid fa-star-half"
                                        style="color: #FFD43B;"></i></p>
                                    <p class="text-secondary">Setra is known for producing high-end touring coaches, intercity buses, and
                                        luxury coaches used for both short-distance and long-distance travel.</p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div>
                            <figure class="shadow" data-aos="zoom-in" data-aos-duration="1400">
                                <img src="./Images/Illustration/bus-2.jpg" class="img-fluid rounded-2" alt="">
                                <figcaption class="p-3">
                                    <p class="bus-quote display-6 fw-bold">Van Hool Bus</p>
                                    <p><i class="fa-solid fa-star" style="color: #FFD43B;"></i><i class="fa-solid fa-star"
                                        style="color: #FFD43B;"></i><i class="fa-solid fa-star"
                                        style="color: #FFD43B;"></i><i class="fa-solid fa-star"
                                        style="color: #FFD43B;"></i><i class="fa-solid fa-star-half"
                                        style="color: #FFD43B;"></i></p>
                                    <p class="text-secondary">Van Hool is known for producing high-end touring coaches, intercity buses and
                                        luxury coaches used for short-distance travel.</p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div>
                            <figure class="shadow" data-aos="zoom-in" data-aos-duration="1700">
                                <img src="./Images/Illustration/bus-3.jpg" class="img-fluid rounded-2" alt="">
                                <figcaption class="p-4">
                                    <p class="bus-quote display-6 fw-bold">MCI Bus</p>
                                    <p><i class="fa-solid fa-star" style="color: #FFD43B;"></i><i class="fa-solid fa-star"
                                        style="color: #FFD43B;"></i><i class="fa-solid fa-star"
                                        style="color: #FFD43B;"></i><i class="fa-solid fa-star"
                                        style="color: #FFD43B;"></i><i class="fa-solid fa-star-half"
                                        style="color: #FFD43B;"></i></p>
                                    <p class="text-secondary">MCI is known for producing high-end touring coaches, intercity buses and
                                        luxury coaches used for long distance travel.</p>      
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main>


    <footer>

    </footer>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="./js/busstylescript.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>