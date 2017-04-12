<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>MixedFinal</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.panel-heading .accordion-toggle:after {
	/* symbol for "opening" panels */
	font-family: 'Glyphicons Halflings';
	/* essential for enabling glyphicon */
	content: "\e113"; /* adjust as needed, taken from bootstrap.css */
	float: right; /* adjust as needed */
	color: black; /* adjust as needed */
}

.panel-heading .accordion-toggle.collapsed:after {
	/* symbol for "collapsed" panels */
	content: "\e114"; /* adjust as needed, taken from bootstrap.css */
}

.accordion-toggle:hover {
	text-decoration: none;
}

body {
	font-family: "Lato", sans-serif;
}

ul.tab {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Float the list items side by side */
ul.tab li {
	float: left;
}

/* Style the links inside the list items */
ul.tab li a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of links on hover */
ul.tab li a:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
ul.tab li a:focus,.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}

.green {
	color: #00cc00;
}
</style>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-sm-12" style="background-color: #314140;">
				<p style="color: #ffffff;">
					<span class="glyphicon glyphicon-dashboard"></span>UniContact Agent
					Desktop <span class="pull-right"><span
						class="glyphicon glyphicon-user"></span>user: ${userName} <a
						href="logout" class="btn btn-link" role="button">logout</a></span>
				</p>
			</div>
		</div>
		<div class="row-fluid">

			<!-- style="background-color: yellow;" -->
			<div class="col-sm-4">
				<div class="panel-group" id="accordion">

					<!-- accordion 1 -->
					<!-- <div class="panel panel-primary"> -->

					<!-- <div class="panel-heading"> -->
					<!-- panel-heading 
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#accordionOne"> Ready </a>
							</h4> -->
					<!-- <div class="dropdown">
    								<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Ready
    								<span class="caret"></span></button>
    								<ul class="dropdown-menu">
								      <li><a href="#">Ready</a></li>
								      <li><a href="#">Not Ready</a></li>
								    </ul>
 							 </div> -->


					Status:
					<div class="form-group">
						<!-- <label for="sel1">Default select list</label> -->
						<select class="form-control" id="selOne" onchange="updateAgent()">
							<option value="Ready">Ready</option>
							<option value="Not Ready">Not Ready</option>
						</select>
					</div>
					<!-- <script type="text/javascript">
							    $(function () {
							        $("#selOne").change(function () {
							            var selectedText = $(this).find("option:selected").text();
							            var selectedValue = $(this).val();
							            alert("User :" + "${userName}" + " Value: " + selectedValue/*  +"${agent.getStatus()}" */);
							        });
							    });
							</script> -->
					<script type="text/javascript">
						/* $(document).ready(function(){
							$("#selOne").change(function(){
								
							});
						});
						 */

						function updateAgent() {
							$
									.ajax({
										url : "/spring-web-bootstrap/rest/agent/updateStatus",
										type : 'post',
										dataType : 'json',
										contentType : 'application/json',
										data : JSON.stringify({
											name : "${userName}",
											status : $("#selOne").val()
										}),
										success : function() {
											alert("status changed to:"
													+ "${agent.getStatus()}");
										},
										error : function() {
											alert("unable to change the status");
										}
									});
						}
					</script>

					<!-- 	</div> -->
					<!-- panel body -->
					<!-- <div id="accordionOne" class="panel-collapse collapse">
							<div class="panel-body" style="man-height: 10"
								style="max-height: 20">Accordion one Implementation</div>
						</div> -->
					<!-- </div> -->

					<%-- <form>
						<div class="form-group">
							<input type="email" class="form-control" id="email"
								placeholder="Type name, number or email..">
						</div>
					</form> --%>

					<!-- accordion 2 -->
					<div class="panel panel-primary">

						<div class="panel-heading" style="background-color: #23363C;">
							<!-- for panel heading width and length :- style="height: 40px; padding: 10" -->
							<h4 class="panel-title">
								<!-- title 2 -->
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#accordionTwo"> Agent
									Interaction </a>
							</h4>
						</div>

						<!-- panel body -->
						<div id="accordionTwo" class="panel-collapse collapse in">
							<div class="row-fluid" style="background: #F1F1F1" align="right">
								<a href="#" class="btn btn-default btn-sm"><span
									class="glyphicon glyphicon-music"></span></a> <a href="#"
									class="btn btn-default btn-sm"> <span
									class="glyphicon glyphicon-folder-open"></span></a> <a href="#"
									class="btn btn-default btn-sm"> <span
									class="glyphicon glyphicon-calendar"></span></a>
							</div>
							<div class="row-fluid">
								<div class="col-sm-12">
									 <img style="float: left;"
										src="C:\Users\mkat1564\Desktop\user.jpg" class="thumbnail"
										width=100 height=100> 
									<!-- <p style="float: left;">My Details</p> -->
								</div>
								
							</div>
							<div class="row">
								<div class="col-sm-12">
									<p align="right">
										In <span class="green">conversation </span>for some time
								</div>
							</div>
							<div class="row">
								<!-- <div class="col-sm-6">
									<a href="#" class="btn btn-danger btn-md btn-block"><span
										class="glyphicon glyphicon-phone"></span> HangUp</a>
								</div>
								<div class="col-sm-6">
									<a href="#" class="btn btn-primary btn-md btn-block"><span
										class="glyphicon glyphicon-music"></span> Hold</a>
								</div> -->

								<!--<div class="col-sm-3">
									 <a href="#" class="btn btn-success" data-toggle="tooltip"
										data-placement="top" title="HangUp"><i
										class="glyphicon glyphicon-minus-sign"></i></a> 
								</div>
								<div class="col-sm-3"></div>-->
								<div class="col-sm-3">
									<a href="#" class="btn btn-danger btn-md btn-block"><span style="font-size:smaller;">HangUp</span></a>
								</div>
								<div class="col-sm-3">
									<a href="#" class="btn btn-primary btn-md btn-block"><span style="font-size:smaller;">Accept</span></a>
								</div>
								<div class="col-sm-3">
									<a href="#" class="btn btn-warning btn-md btn-block"><span style="font-size:smaller;">Hold</span></a>
								</div>
								<div class="col-sm-3">
									<a href="#" class="btn btn-info btn-md btn-block"><span style="font-size:smaller;">Decline</span></a>
								</div>

								<!-- <script>
									$(document).ready(function() {
										$('[data-toggle="tooltip"]').tooltip();
									});
								</script> -->

							</div>
						</div>
					</div>

					<!-- accordion 3 -->
					<!--<div class="panel panel-primary">

						<div class="panel-heading" style="background-color: #23363C;">
							for panel heading width and length :- style="height: 40px; padding: 10"
							<h4 class="panel-title">
								title 3
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#accordionThree"> Session </a>
							</h4>
						</div>

						<div id="accordionThree" class="panel-collapse collapse">
							panel body
							<div class="panel-body">Accordion three Implementation</div>
						</div>

					</div> -->

					Wrapup:
					<div class="form-group">
						<select class="form-control" id="sel2">
							<option disabled selected value> -- select an option -- </option>
							<option value="Done">Done</option>
						</select>
					</div>

					<!-- accordion 4 -->
					<div class="panel panel-primary">

						<div class="panel-heading" style="background-color: #23363C;">
							<h4 class="panel-title">
								<!-- title 4 -->
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#accordionFour"> Contact
									Queue </a>
							</h4>
						</div>

						<div id="accordionFour" class="panel-collapse collapse">
							<!-- panel body -->
							<div class="panel-body" style="man-height: 10"
								style="max-height: 20">Accordion four Implementation</div>
						</div>

					</div>

					<!-- accordion 5 -->
					<div class="panel panel-primary">

						<div class="panel-heading" style="background-color: #23363C;">
							<h4 class="panel-title">
								<!-- title 5-->
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#accordionFive"> Realtime
									Stats Viewer </a>
							</h4>
						</div>

						<div id="accordionFive" class="panel-collapse collapse">
							<!-- panel body -->
							<div class="panel-body">Accordion five Implementation</div>
						</div>

					</div>

				</div>
			</div>

			<div class="col-sm-8">

				<div class="row-fluid">

					<div class="col-sm-12" style="background-color: #E2E3E5;">
						<p style="color: #7F8585;">
							<span class="glyphicon glyphicon-dashboard"></span>5432 - Inbound
						</p>
					</div>
				</div>

				<div class="panel-group" id="accordionOuter">

					<!-- accordion 1 -->
					<div class="panel panel-primary">
						<div class="panel-heading" style="background-color: #285775;">
							<div class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordionOuter" href="#accordionII"> Customer
									Interaction </a>
							</div>
						</div>
						<!-- accordian1 panel body -->
						<div id="accordionII" class="panel panel-collapse in">
							<div class="panel-body">
								Customer video has to be Implemented <br />
								<canvas id="myCanvas" width="750" height="300"
									style="border:1px solid #000000;"> Your browser does
								not support the HTML5 canvas tag. </canvas>
							</div>
						</div>
					</div>

					<!-- accordion 2 -->
					<div class="panel panel-primary">
						<div class="panel-heading" style="background-color: #285775;">
							<div class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordionOuter" href="#accordionI"> Customer
									Interaction Details </a>
							</div>
						</div>
						<!-- accordian2 panel body -->
						<div id="accordionI" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="row-fluid">
									<!-- style="background-color: #9CF" -->
									<div class="col-sm-6">
										<!-- style="background-color: lightcyan;" -->
										<div class="panel-group" id="accordionInner">

											<!-- accordion 1 -->
											<div class="panel panel-primary">

												<div class="panel-heading" style="backgroun-color: #285775">
													<h4 class="panel-title">
														<a data-toggle="collapse" data-parent="#accordionInner"
															href="#accordion1"> <span
															class="glyphicon glyphicon-chevron-down"></span> Address
															List
															<div class="pull-right">
																<span class="badge">1</span>
															</div>
														</a>
													</h4>
												</div>
												<!-- panel body -->
												<div id="accordion1" class="panel-collapse collapse">
													<div class="panel-body">Address List has to be
														implemented</div>
												</div>
											</div>

											<!-- accordion 2 -->
											<div class="panel panel-primary">

												<div class="panel-heading" style="backgroun-color: #285775">
													<h4 class="panel-title">
														<a data-toggle="collapse" data-parent="#accordionInner"
															href="#accordion2"> <span
															class="glyphicon glyphicon-chevron-down"></span>Issues
															History
															<div class="pull-right">
																<span class="badge">2</span>
															</div></a>
														<!-- See BS Badges and Labels for numbers aside -->
													</h4>
												</div>
												<!-- panel body -->
												<div id="accordion2" class="panel-collapse collapse">
													<div class="panel-body">Issues History implementation</div>
												</div>

											</div>

											<!-- accordion 3 -->
											<div class="panel panel-primary">

												<div class="panel-heading" style="backgroun-color: #285775">
													<h4 class="panel-title">
														<a data-toggle="collapse" data-parent="#accordionInner"
															href="#accordion3"> <span
															class="glyphicon glyphicon-chevron-down"></span>Pending
															Issues
															<div class="pull-right">
																<span class="badge">3</span>
															</div></a>
													</h4>
												</div>

												<div id="accordion3" class="panel-collapse collapse">
													<!-- panel body -->
													<div class="panel-body">Pending Issues has to be
														implemented</div>
												</div>

											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<!-- style="background-color: lightgray;" -->
										<p>Click on the links inside the tabbed menu:</p>

										<ul class="tab">
											<li><a href="#" class="tablinks"
												onclick="openTab(event, 'Customer Interaction')">Customer
													Interaction</a></li>
											<li><a href="#" class="tablinks"
												onclick="openTab(event, 'Customer')">Customer</a></li>
										</ul>

										<div id="Customer Interaction" class="tabcontent">
											<!-- <h3>Customer Interaction</h3> -->
											<p>Here we need to implement Customer Interaction</p>
										</div>

										<div id="Customer" class="tabcontent">
											<!-- <h3>Customer</h3> -->
											<p>customer details has to implemented here</p>
										</div>

										<script>
											function openTab(evt, customerName) {
												var i, tabcontent, tablinks;
												tabcontent = document
														.getElementsByClassName("tabcontent");
												for (i = 0; i < tabcontent.length; i++) {
													tabcontent[i].style.display = "none";
												}
												tablinks = document
														.getElementsByClassName("tablinks");
												for (i = 0; i < tablinks.length; i++) {
													tablinks[i].className = tablinks[i].className
															.replace(" active",
																	"");
												}
												document
														.getElementById(customerName).style.display = "block";
												evt.currentTarget.className += " active";
											}
										</script>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>