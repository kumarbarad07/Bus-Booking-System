<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Project of Bus Reservation System">
    <meta name="keywords" content="Bus Reservation System Project">
    <title>About Us</title>
    <link rel="stylesheet" href="./css/aboutusstyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Geologica:wght@100..900&display=swap');
    </style>
</head>

<body>

    <header>
        <section class="mb-5 pb-5">
            <div class="banner">
                <nav
                    class="navbar navbar-expand-lg bg-body-tertiary  fixed-top justify-content-lg-evenly shadow gradient-custom">
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
                                <a href="aboutus.jsp" class="nav-link active text-uppercase text-warning"
                                    aria-current="page">About US</a>
                            </li>
                            <li class="nav-item">
                                <a href="ourbuses.jsp" class="nav-link text-uppercase text-light">Our Buses</a>
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
                <p class="display-5 fw-bold text-primary mb-4">Our Routine</p>
                <div class="row">
                    <div class="col-xl-6">
                        <div class="row">
                            <div class="col-md-6">
                                <div>
                                    <img src="./Images/Illustration/international-touring-coach-bus-concept.jpg"
                                        class="gridimg-1" alt="">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div>
                                    <img src="./Images/Illustration/touristic-buses.jpg" class="img-fluid mb-3" alt="">
                                    <img src="./Images/Illustration/view-the-yellow-school-buses-parked-near-the-high-school.jpg"
                                        class="img-fluid" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="p-3">
                            <p class="display-5 fw-bold service-text">We make sure every bus is in excellent shape</p>
                            <p class="text-secondary fs-6">we perform daily inspections on every bus in our fleet,
                                ensuring that all components,
                                from the engine to the brakes, are in optimal condition for the smoothest, safest ride
                                possible.</p>
                            <ul class="lh-lg ps-0">
                                <li><i class="fa-solid fa-check fa-lg pe-2" style="color: #ffc800;"></i> Confirming a proper amount
                                    of engine oil and coolant</li>
                                <li><i class="fa-solid fa-check fa-lg pe-2" style="color: #ffc800;"></i> Ensuring that tire
                                    pressure is at an appropriate level</li>
                                <li><i class="fa-solid fa-check fa-lg pe-2" style="color: #ffc800;"></i> Measuring tire tread depth
                                    for optimum traction</li>
                                <li><i class="fa-solid fa-check fa-lg pe-2" style="color: #ffc800;"></i> Keeping electrical
                                    equipment clean and free of dust</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main>


    <footer>

    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>