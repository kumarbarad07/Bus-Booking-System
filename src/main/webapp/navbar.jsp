<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<header>
    <section>
        <div class="banner">
            <nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top justify-content-lg-evenly gradient-custom">
                <a href="index.jsp" class="navbar-brand">
                    <img src="./Images/Illustration/Logo_bigtranz_1.png" class="navbarlogo" alt="">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarcontent"
                    aria-controls="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse flex-grow-0" id="navbarcontent">
                    <ul class="navbar-nav gap-xl-3">
                        <li class="nav-item">
                                <a href="#" class="nav-link active text-uppercase text-warning"
                                    aria-current="page">Home</a>
                            </li>
                        <li class="nav-item">
								<a href="aboutus.jsp" class="nav-link text-uppercase text-light">About Us</a>
						</li>
                        <li class="nav-item">
								<a href="ourbuses.jsp" class="nav-link text-uppercase text-light">Our Buses</a>
						</li>
                        <li class="nav-item">
								<a href="login.jsp" class="nav-link text-uppercase text-light">Bookings</a>
						</li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle text-uppercase text-light" role="button" data-bs-toggle="dropdown" aria-expanded="false">Rate Chart</a>
                            <ul class="dropdown-menu">
                                <li><a href="#" class="dropdown-item text link-underline-success">Destination 1</a></li>
                                <li><a href="#" class="dropdown-item">Destination 2</a></li>
                                <li><a href="#" class="dropdown-item">Destination 3</a></li>
                                <li><a href="#" class="dropdown-item">Destination 4</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                        		<a href="contactus.jsp" class="nav-link text-uppercase text-light">Contact Us</a>
                        </li>
                    </ul>
                </div>

                <div>                    
                     <a href="login.jsp" class="btn btn-outline-secondary text-light">Login</a>
                     <a href="signup.jsp" class="btn btn-outline-primary text-light">SignUp</a>
                </div>

            </nav>
        </div>
    </section>
</header>
