INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.tolministries.org/branches/food/', 'Tree of Life: Community Dinner', '115 East Main Street', 'Purcellville', 'VA', '20132', 39.13699833, -77.71451662, '(540) 441-7920', 'info@tolministries.org', ARRAY['ANY'], NULL, 'Join us every THURSDAY evening for a sit-down FREE MEAL. We are on site serving meals starting at 5:30 pm until supplies last.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (1, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (1, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (1, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (1, 'THURSDAY', 'OPEN', '5:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (1, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (1, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (1, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.tolministries.org/branches/food/', 'Tree of Life: Community Dinner', '120 Enterprise St', 'Sterling', 'VA', '20164', 38.99887972, -77.40201992, '(540) 441-7920', 'info@tolministries.org', ARRAY['ANY'], NULL, 'Join us every TUESDAY evening for a sit down FREE MEAL. We are on site serving meals starting at 6:30PM until supplies last.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'TUESDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.capitalareafoodbank.org/what-we-do/direct-food-distribution-programs/community-marketplaces/', 'Capital Area Food Bank: Southgate Community Center', '12125 Pinecrest Rd', 'Reston', 'VA', '20191', 38.94179263, -77.36571349, '(202) 644-9807', 'hungerlifeline@capitalareafoodbank.org', NULL, CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Only open on the SECOND Saturday of each month. Participating in a Community Marketplace is simple. We recommend arriving to your area’s marketplace around 9 a.m. on the day of the distribution, with a container to hold your produce. We suggest a reusable shopping bag or a rolling cart. Stop by the registration desk and fill out the registration form, which asks for contact information, household information, and a few other details. Once that’s finished, we’ll give you a key card, just like the ones you get at a grocery store. Keep this key card and bring it to every Community Marketplace that you attend to enter the marketplace.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'SATURDAY', 'OPEN', '8:30:00 AM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.capitalareafoodbank.org/what-we-do/direct-food-distribution-programs/community-marketplaces/', 'Capital Area Food Bank: Rosedale Recreation Center', '1701 Gales Street NE Ward 7 ', 'Washington', 'DC', '20002', 38.89727827, -76.97898345, '(202) 644-9807', 'hungerlifeline@capitalareafoodbank.org', NULL, CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Only open on the FIRST Saturday of each month. Participating in a Community Marketplace is simple. We recommend arriving to your area’s marketplace around 9 a.m. on the day of the distribution, with a container to hold your produce. We suggest a reusable shopping bag or a rolling cart. Stop by the registration desk and fill out the registration form, which asks for contact information, household information, and a few other details. Once that’s finished, we’ll give you a key card, just like the ones you get at a grocery store. Keep this key card and bring it to every Community Marketplace that you attend to enter the marketplace.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (4, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (4, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (4, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (4, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (4, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (4, 'SATURDAY', 'OPEN', '8:30:00 AM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (4, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.alive-inc.org/food-program-in-alexandria-virginia/', 'ALIVE! Community Fresh Market: Leonard “Chick” Armstrong Recreation Center', '3600 Commonwealth Ave', 'Alexandria', 'VA', '22305', 38.83785, -77.058, '(703) 837-9300', NULL, ARRAY['20598', '22301', '22302', '22303', '22304', '22305', '22306', '22307', '22308', '22309'], CAST ( ARRAY['NONE'] AS supported_diet[] ), 'ALIVE! distributes free bags of groceries (produce, chicken, eggs, bread) at multiple locations on the LAST Saturday of the month from 8:30 am – 10:30 am. Please bring reusable bags. ALIVE! food distributions are for City of Alexandria residents. Proof of Alexandria City residency may be requested.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'SATURDAY', 'OPEN', '8:30:00 AM', '10:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://southernusa.salvationarmy.org/nca/arlington-va/', 'The Salvation Army: Arlington Corps', '518 South Glebe Road', 'Arlington', 'VA', '22204', 38.8665, -77.0954, '(703) 979-3380', NULL, ARRAY['20598', '22201', '22202', '22203', '22204', '22205', '22206', '22207', '22209', '22210'], NULL, 'Requires application here: https://sahelp.org/. Food distribution takes place on the FIRST and SECOND Thursday of the month, open between the specified hours, while supplies last. Closed from 11:30 - 13:30. Offers fluent Spanish speakers.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'THURSDAY', 'OPEN', '9:30:00 AM', '3:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://abidingpresence.net/food', 'Abiding Presence Lutheran Church', '6304 Lee Chapel Road', 'Burke', 'VA', '22015', 38.78101, -77.2771, '(703) 455-7500', 'office@abidingpresence.net', ARRAY['ANY'], NULL, 'Only open on the SECOND and FOURTH Saturdays of each month. Must arrive by 7:00am to receive pantry goods. Must be over 18. You may only pick up food for your household. Abiding Presence offers a “no questions asked” food pantry for anyone in need. This is our primary method of offering assistance. We are not able to provide rental, gas, clothing, gift card or cash assistance. ', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (7, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (7, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (7, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (7, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (7, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (7, 'SATURDAY', 'OPEN', '7:00:00 AM', '10:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (7, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://centreville-umc.org/local-outreach/food-ministries/grace-ministries/', 'Centreville United Methodist Church', '6400 Old Centreville Rd', 'Centreville', 'VA', '20121', 38.82568, -77.4398, '(703) 830-2684', NULL, NULL, NULL, 'Only open on the SECOND Saturday of each month. Lines begin to form before 7:00am. ', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'SATURDAY', 'OPEN', '7:00:00 AM', '9:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://loudounhunger.org/', 'Loudoun Hunger Relief: Mobile Market', '65 Sugarland Run Dr.', 'Sterling', 'VA', '20164', 39.03676, -77.3828, '(703) 777-5911', 'info@loudounhunger.org', ARRAY['20180', '20132', '20197', '20176', '20141', '20158', '20129', '20175', '20135', '20184', '20130', '20117', '20105', '20152', '20120', '20151', '20166', '20170', '20148', '20164', '22066', '20165', '20147', '20200'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'No appointment required. First come, first served, while supplies last. End time is subject to food availability.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'THURSDAY', 'OPEN', '10:00:00 AM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.unitedcommunity.org/programs/cynthia-hull-food-pantry/', 'Cynthia Hull Food Pantry', '7511 Fordson Road', 'Alexandria', 'VA', '22306', 38.75381921, -77.08519172, '(703) 768-7106', 'info@unitedcommunity.org', ARRAY['22303', '22306', '22307', '22308', '22309', '22310'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Please bring the following when registering for food assistance: Universal Intake/TEFAP Form; Photo ID for all adults and birth certificates for children under 18; Proof of Address (e.g., lease or utility bill); Proof of Income -- two recent pay stubs or income letter from employer; documentation of any other income assistance (SSI, SSDI, TANF, SNAP, child support)', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'MONDAY', 'OPEN', '10:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'TUESDAY', 'OPEN', '12:00:00 PM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'WEDNESDAY', 'OPEN', '2:00:00 PM', '5:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'THURSDAY', 'OPEN', '12:00:00 PM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Summit Oaks', '10550 Oak Bluff Ct', 'Burke', 'VA', '22015', 38.7978259, -77.30783174, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'THURSDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Crevenna Oak', '10955 Crevenna Oak Dr', 'Burke', 'VA', '22015', 38.7960884, -77.3231978, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. In the parking lot of the specified address. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'THURSDAY', 'OPEN', '6:00:00 PM', '7:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://ccda.net/find-help/food/sterling-food-pantry/', 'Catholic Charities Loudoun Regional Office (LRO)', '113 Executive Drive, Building #2, Suite 110', 'Sterling', 'VA', '20166', 38.99007038, -77.4439262, '(703) 443-6693', 'LROpantry@ccda.net', NULL, NULL, 'Clients are eligible to receive food once every 30 days. Picture ID and Proof of current address required at every visit.By Appointment only – schedule your appointment by using this link: https://food-pantry-appointment.as.me/schedule/dd935c2f', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'MONDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'TUESDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'WEDNESDAY', 'OPEN', '10:00:00 AM', '12:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'THURSDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.tolministries.org/food-pantry/', 'Tree of Life: Western Loudoun Pantry', '115 East Main Street', 'Purcellville', 'VA', '20132', 39.13699833, -77.71451662, '(540) 441-7920', 'info@tolministries.org', ARRAY['20180', '20132', '20197', '20176', '20141', '20158', '20129', '20175', '20135', '20184', '20130', '20117', '20105', '20152', '20120', '20151', '20166', '20170', '20148', '20164', '22066', '20165', '20147', '20198', '20130', '20135', '22611', '22620', '22663', '20130', '20185'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Serving All of Loudoun + Northern Fauquier and Clarke Counties. Tree of Life''s Food Pantries provide free groceries to those in need.  Once a month, those in need can call in to request food and receive two to three weeks'' worth of groceries from one our regional Food Pantries. In most cases, we are able to deliver the food directly to the home of the person in need. Consideration is given to food preferences and allergies.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'MONDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'TUESDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'WEDNESDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'THURSDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'FRIDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://cho-va.com/', 'Committee for Helping Others', '124 Park St. NE', 'Vienna', 'VA', '22180', 38.90385177, -77.26415486, '(703) 281-7614', 'cho@cho-va.com', ARRAY['22180', '22181', '22182', '22183', '22185', '22124', '22027', '22081', '22082', '22116', '22118', '22119'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Vienna, Oakton, Dunn Loring, and Merrifield Residents. If you want to pick up food, you must make an appointment; call 703-281-7614. We provide “emergency” food, not long-term food service.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'MONDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'TUESDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'WEDNESDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'THURSDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'FRIDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'SATURDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'SUNDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://penderumc.org/pender-blog/helping-our-neighbors-through-penders-mini-food-pantry/', 'Pender Mini Food Pantry', '12401 Alder Woods Drive', 'Fairfax', 'VA', '22033', 38.87450881, -77.37803003, '(703) 278-8023', 'church.office@penderumc.org', ARRAY['ANY'], CAST ( ARRAY['NONE'] AS supported_diet[] ), 'A small take-what-you-need food pantry. Open 24/7.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (16, 'MONDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (16, 'TUESDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (16, 'WEDNESDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (16, 'THURSDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (16, 'FRIDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (16, 'SATURDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (16, 'SUNDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.njlclovettsville.org/food-pantry', 'Western Loudoun Food Pantry', '12942 Lutheran Church Rd.', 'Lovettsville', 'VA', '20180', 39.25794596, -77.63932227, '(540) 822-5576', ' officenjlc@gmail.com', ARRAY['ANY'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Shopping-style food pantry. Appointments also available outside of open hours. We require no proof of residency or eligibility. We seek to work with our community based on the honor system. If you truly have a need, we want to help as we are able. We only ask for your last name for inventory purposes.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (17, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (17, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (17, 'WEDNESDAY', 'OPEN', '2:00:00 PM', '5:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (17, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (17, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (17, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (17, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://search.211virginia.org/search/ce8758da-1093-5dba-ae56-f013ebbf8bbe', 'Catholic Charities Christ House', '131 South West Street', 'Alexandria', 'VA', '22314', 38.80511107, -77.05497135, '(703) 549-8644', 'ChristHouse@ccda.net', NULL, NULL, 'The Christ House offers an Evening Meal each night of the year.   The dinners are to-go meals and can be picked up every night, in all weather conditions, from 5 to 5:30 p.m.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'MONDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'TUESDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'WEDNESDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'THURSDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'FRIDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'SATURDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'SUNDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.gohopenova.org/', 'Grains of Hope', '13224 Franklin Farm Rd', 'Herndon', 'VA', '20171', 38.90808602, -77.40371326, '(703) 620-1977', 'food@cofumc.org ', ARRAY['ANY'], NULL, 'No registration needed.  Neighbors often begin arriving as early as 2:00 PM to get in line, but distribution does not begin until 4:00 PM.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (19, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (19, 'TUESDAY', 'OPEN', '4:00:00 PM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (19, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (19, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (19, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (19, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (19, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.florisumc.org/wp-content/uploads/2025/12/2026-Distribution-Flyer-1.pdf', 'Floris United Methodist Church', '13600 Frying Pan Rd', 'Herndon', 'VA', '20171', 38.94278447, -77.41682817, '(703) 793-0026', 'floris@florisumc.org', ARRAY['ANY'], NULL, 'Only open on the FIRST Saturday of each month. Must bring proof of Virginia residency. Lines typically begin to form at 7:30am.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'SATURDAY', 'OPEN', '8:00:00 AM', '9:00:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://loudounhunger.org/', 'Loudoun Hunger Relief: Sterling', '18 Export Dr.', 'Sterling', 'VA', '20164', 38.99318509, -77.42650499, '(703) 777-5911', 'info@loudounhunger.org', ARRAY['20180', '20132', '20197', '20176', '20141', '20158', '20129', '20175', '20135', '20184', '20130', '20117', '20105', '20152', '20120', '20151', '20166', '20170', '20148', '20164', '22066', '20165', '20147', '20199'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'By appointment only. Must provide proof of Loudoun County residency. See website for details.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'MONDAY', 'OPEN', '12:30:00 PM', '2:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://mapping.littlefreepantry.org/pantry/3084', 'Little Yellow Free Pantry', '203 S Fillmore St', 'Arlington', 'VA', '22204', 38.87068132, -77.08814013, NULL, 'kindnessactivist@gmail.com', ARRAY['ANY'], CAST ( ARRAY['NONE'] AS supported_diet[] ), 'A small, standalone pantry that offers canned goods, toiletries, and other nonperishables.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'MONDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'TUESDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'WEDNESDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'THURSDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'FRIDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'SATURDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'SUNDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.unitedcommunity.org/programs/food-assistance-programs/', 'Community Mobile Market: Walt Whitman Middle School', '2500 Parkers Lane', 'Alexandria', 'VA', '22306', 38.74149934, -77.07443392, '(703) 660-2464', 'info@unitedcommunity.org', ARRAY['22303', '22306', '22307', '22308', '22309', '22310'], NULL, 'Open on the FIRST Wednesday of each month. Please bring the following when registering for food assistance: Universal Intake/TEFAP Form; Photo ID for all adults and birth certificates for children under 18; Proof of Address (e.g., lease or utility bill); Proof of Income -- two recent pay stubs or income letter from employer; documentation of any other income assistance (SSI, SSDI, TANF, SNAP, child support)', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'WEDNESDAY', 'OPEN', '3:00:00 PM', '4:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.alive-inc.org/food-program-in-alexandria-virginia/', 'Alexandrians Involved Ecumenically Food Warehouse (ALIVE)', '2601 Mount Vernon Avenue', 'Alexandria', 'VA', '22301', 38.82858207, -77.05880537, '(703) 837-9300', NULL, ARRAY['20598', '22301', '22302', '22303', '22304', '22305', '22306', '22307', '22308', '22310'], NULL, 'Alexandria residents with free groceries, personal care items, cleaning supplies, school supplies, and connections to other helpful services. Neighbors are welcome to visit once a month, and proof of residency may be requested.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'TUESDAY', 'OPEN', '12:00:00 PM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'WEDNESDAY', 'OPEN', '12:00:00 PM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'THURSDAY', 'OPEN', '12:00:00 PM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'SATURDAY', 'OPEN', '9:00:00 AM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Gunston', '2700 S Lang St', 'Arlington', 'VA', '22206', 38.84723023, -77.07106826, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Gunston Community Center, 2700 South Lang Street, at Gunston Middle School, entrance near soccer field, Arlington. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.

', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'TUESDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.ourladyqueenofpeace.org/food-pantry.html', 'Our Lady Queen of Peace', '2700 South 19th Street', 'Arlington', 'VA', '22204', 38.85412037, -77.0831265, '(703) 979-5580', 'sdiazwells@olqpva.org', NULL, NULL, NULL, FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'WEDNESDAY', 'OPEN', '9:00:00 AM', '11:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://afac.org/', 'Arlington Food Assistance Center', '2708 S. Nelson Street', 'Arlington', 'VA', '22206', 38.84362412, -77.08932947, '(703) 845-8486', 'clientservices@afac.org', ARRAY['22101', '22213', '22207', '22205', '22201', '22209', '22203', '22204', '22206', '22211', '20301', '22202', '20001'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Must live in Arlington and get a referral from an Arlington County social service agency.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'MONDAY', 'OPEN', '9:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'TUESDAY', 'OPEN', '6:00:00 PM', '7:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'WEDNESDAY', 'OPEN', '9:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'THURSDAY', 'OPEN', '6:00:00 PM', '7:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'FRIDAY', 'OPEN', '9:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'SATURDAY', 'OPEN', '8:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Hollywood', '2802 Hollywood Road', 'Falls Church', 'VA', '22043', 38.87836908, -77.20827606, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Parking lot of Wexford Manor Apartments, south of Savannah Street, Falls Church. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'WEDNESDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'FRIDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.sterlingumc.org/grace', 'Sterling UMC', '304 East Church Rd', 'Sterling', 'VA', '20164', 39.00773479, -77.39233824, '(703) 430-6455', 'grace.sumc@gmail.com', NULL, NULL, 'Only open on the SECOND Saturday of each month. ', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'SATURDAY', 'OPEN', '8:00:00 AM', '10:00:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://hijrah.org/donations/food-bank-2/', 'Dar Al-Hijrah Islamic Center', '3159 Row Street', 'Falls Church', 'VA', '22044', 38.86141124, -77.14668203, '(703) 536-1030', 'socialservices@hijrah.org', ARRAY['20598', '22201', '22202', '22203', '22204', '22205', '22206', '22207', '22209', '22210', '20151', '20152', '20153', '20598', '22030', '22031', '22032', '22033', '22034', '22035', '22003', '20598', '22301', '22302', '22303', '22304', '22305', '22306', '22307', '22308', '22309'], CAST ( ARRAY['HALAL'] AS supported_diet[] ), 'Requires registration. The DAH Food Bank distributes fresh produce and halal chicken every Thursday morning from 9:00am until 11:00am, or when the food runs out. All who are in need are welcome to register for our food bank regardless of their faith, background or legal status.
', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'THURSDAY', 'OPEN', '9:00:00 AM', '11:00:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.meadechurch.org/default.asp', 'Meade Memorial Episcopal Bag Lunch Program', '322 N. Alfred Street', 'Alexandria', 'VA', '22314', 38.80833, -77.0488, '(703) 549-1334', NULL, NULL, NULL, 'Availability listed for Saturday only applies for October through April.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'MONDAY', 'OPEN', '11:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'TUESDAY', 'OPEN', '11:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'WEDNESDAY', 'OPEN', '11:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'THURSDAY', 'OPEN', '11:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'FRIDAY', 'OPEN', '11:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'SATURDAY', 'OPEN', '12:30:00 PM', '1:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.arha.us/youth-and-family-programs', 'Ruby Tucker Family Center Food Pantry', '322 Tancil Ct', 'Alexandria', 'VA', '22314', 38.80841, -77.0418, '(703) 535-3175', 'info@arha.us', NULL, NULL, 'Open on the SECOND Friday of the month.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (32, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (32, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (32, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (32, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (32, 'FRIDAY', 'OPEN', '10:30:00 AM', '12:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (32, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (32, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://columbia.church/join-the-mission/local/food-pantry/', 'Columbia Food Pantry', '3245 Glen Carlyn Road', 'Falls Church', 'VA', '22041', 38.85774123, -77.1384695, '7035345700', 'foodpantry@columbia.church', ARRAY['ANY'], NULL, 'We do not require referrals or check IDs. Anyone is welcome each Saturday, between 9:00 am and 10:30 am. Clients generally receive 15-20 non-perishable and fresh produce.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'SATURDAY', 'OPEN', '9:00:00 AM', '10:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.fairfaxcounty.gov/neighborhood-community-services/resource-centers', 'Culmore Family Resource Center', '3304-B Culmore Court', 'Falls Church', 'VA', '22041', 38.85596541, -77.14131716, '(703) 379-5217', NULL, ARRAY['22041', '22042', '22043', '22044', '22046'], NULL, 'Bring your own bags. Use the basement entrance. You should arrive by 12:00pm - 12:30pm to wait in line, as they typically form well before the pantry hours. Call the listed phone number for questions.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'THURSDAY', 'OPEN', '1:00:00 PM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.stanthonyparish.org/food-pantry/', 'St. Anthony of Padua Catholic Church', '3305 Glen Carlyn Rd. ', 'Falls Church', 'VA', '22041', 38.85626582, -77.13771133, '(703) 820-7111', 'office@stanthonyparish.org', NULL, NULL, 'St. Anthony’s provides food assistance to those in need in our community. The Food Pantry operates two days a week (Monday and Wednesday) from 10am to 1pm. If you are new to the food pantry, registration for new members is only available on Wednesdays. It is only closed if Monday or Wednesday are federal holidays. Please arrive as early as possible, dependent on wait times, if arriving near closing time at 1pm, service is not guaranteed. Each Saturday morning, a team of volunteers also packages meals for day laborers in our community. When finances permit, some financial support for rent and other emergency expenses is also provided to deserving individuals.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'MONDAY', 'OPEN', '10:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'WEDNESDAY', 'OPEN', '10:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.culmoreumc.org/food--clothing-ministry.html', 'Culmore United Methodist Church', '3400 Charles Street', 'Falls Church', 'VA', '22041', 38.85333104, -77.13630687, '(703) 820-5131', 'culmoreumc@vacoxmail.com', NULL, NULL, 'In partnership with the Capital Area Food Bank operates “the mobile food pantry” in our church parking lot.  Culmore Church members and volunteers from the local community distribute tens of thousands of pounds of fresh produce to over two hundred neighborhood families. The food pantry is held every 2nd Friday of each month. In addition to the mobile food pantry, Culmore Church partners with Grace Ministries (of the United Methodist Church) with funding from Fairfax County, on the fourth Friday of each month to distribute packages of food and clothing one hundred needy households. Culmore UMC also maintains a food pantry for drop-ins who are running low on food. The pantry stocks essential non perishable foodstuffs as well as a limited array of frozen food to ensure that no one in need walks away without something to eat. Culmore Church also operates a daily food rescue pantry from the Church office. The pantry is stocked with basic supplies of non-perishable consumer packaged foods; staples like beans and rice and pasta.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'MONDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'TUESDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'WEDNESDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'THURSDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'FRIDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.obcalexandria.church/ministries', 'Oakland Baptist Church Food Bank', '3408 King Street', 'Alexandria', 'VA', '22302', 38.82623, -77.0866, '(703) 998-9006', 'info@obcalexandria.church', NULL, NULL, 'Open on the FIRST and THIRD Fridays every month.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'FRIDAY', 'OPEN', '11:00:00 AM', '12:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://gracealex.org/about/our-food-pantry', 'Grace Church', '3601 Russell Road', 'Alexandria', 'VA', '22305', 38.83728, -77.0648, '(703) 549-1980', NULL, ARRAY['ANY (VA)'], NULL, 'Each family may receive food twice monthly, one bag per household.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'TUESDAY', 'OPEN', '6:00:00 PM', '7:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'FRIDAY', 'OPEN', '6:00:00 PM', '7:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.unitedcommunity.org/programs/food-assistance-programs/', 'Community Mobile Market: Mount Vernon Woods Elementary School', '4015 Fielding St.', 'Alexandria', 'VA', '22309', 38.74253, -77.0999, '(571) 255-8958', 'info@unitedcommunity.org', ARRAY['22303', '22306', '22307', '22308', '22309', '22310'], NULL, 'Open on the FIRST Monday of each month. Please bring the following when registering for food assistance: Universal Intake/TEFAP Form; Photo ID for all adults and birth certificates for children under 18; Proof of Address (e.g., lease or utility bill); Proof of Income -- two recent pay stubs or income letter from employer; documentation of any other income assistance (SSI, SSDI, TANF, SNAP, child support)', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (39, 'MONDAY', 'OPEN', '4:00:00 PM', '5:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (39, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (39, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (39, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (39, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (39, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (39, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Fairmont Gardens', '4137 Wadsworth Court', 'Annandale', 'VA', '22003', 38.8353, -77.2036, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Only open on the THIRD Thursday of each month. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'THURSDAY', 'OPEN', '11:00:00 AM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.tolministries.org/food-pantry/', 'Tree of Life: Eastern Loudoun Pantry', '45189 Research Place, Building A', 'Ashburn', 'VA', '20147', 39.05113797, -77.4359138, '(540) 441-7920', 'info@tolministries.org', ARRAY['20180', '20132', '20197', '20176', '20141', '20158', '20129', '20175', '20135', '20184', '20130', '20117', '20105', '20152', '20120', '20151', '20166', '20170', '20148', '20164', '22066', '20165', '20147', '20198', '20130', '20135', '22611', '22620', '22663', '20130', '20184'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Serving All of Loudoun + Northern Fauquier and Clarke Counties. Tree of Life''s Food Pantries provide free groceries to those in need.  Once a month, those in need can call in to request food and receive two to three weeks'' worth of groceries from one our regional Food Pantries. In most cases, we are able to deliver the food directly to the home of the person in need. Consideration is given to food preferences and allergies.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'MONDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'TUESDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'WEDNESDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'THURSDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'FRIDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.loudoun.gov/1578/WIC-Program', 'Loudoun County WIC Program: Ashburn', '45201 Research Place, Suite 120', 'Ashburn', 'VA', '20147', 39.05104124, -77.43547703, '(703) 777-0239', 'health@loudoun.gov', ARRAY['ANY (VA)'], NULL, 'By appointment only. Friday hours are virtual only. The Special Supplemental Nutrition Program for Women, Infants, and Children (WIC) helps improve the health of pregnant, postpartum and breastfeeding women, as well as infants and children under 5 years old. Participants must meet income, residential and nutrition-risk eligibility requirements. ', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'MONDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'TUESDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'WEDNESDAY', 'OPEN', '8:00:00 AM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'THURSDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'FRIDAY', 'OPEN', '8:00:00 AM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.linkagainsthunger.org/get-help', 'LINK Against Hunger: Food Assistance Delivery', '46833 Harry Byrd Highway', 'Sterling', 'VA', '20164', 39.01523, -77.3722, '(703) 437-1776', NULL, ARRAY['20170', '20171', '20172', '20190', '20191', '20192', '20194', '20195', '20196', '20598'], NULL, 'LINK delivers food assistance to people in the Herndon and Sterling areas of Northern, Virginia. If you have a food request, please call LINK at 703-437-1776 and leave a message. A LINK volunteer will contact you to verify your need and schedule a delivery as appropriate.  As we do not have full-time staff to provide immediate response to your messages, we thank you for your patience and understanding.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'MONDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'TUESDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'WEDNESDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'THURSDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'FRIDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'SATURDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'SUNDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.linkagainsthunger.org/get-help', 'LINK Against Hunger: Mobile Food Pantry', '46833 Harry Byrd Highway', 'Sterling', 'VA', '20164', 39.01523, -77.3722, '(703) 437-1776', NULL, ARRAY['ANY'], NULL, 'Direct any questions to the online "Contact Us" form -- the phone number should be used for emergencies. Every second Tuesday of the month, LINK hosts a Mobile Food Pantry in the rear parking lot of Christ the Redeemer Church, located at 46833 Harry Byrd Highway, Sterling. The event takes place from 9am until all food has been distributed.  The start time varies based on the delivery arrival. The food, generously donated by the Capital Area Food Bank, typically includes vegetables, fruits, and canned goods. There are no eligibility restrictions; all individuals who attend are welcome to receive food.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'TUESDAY', 'OPEN', '9:00:00 AM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.loudoun.gov/1578/WIC-Program', 'Loudoun County WIC Program: Leesburg', '50 Sycolin Road', 'Leesburg', 'VA', '20176', 39.10628, -77.5538, '(703) 777-0239', 'health@loudoun.gov', ARRAY['ANY (VA)'], NULL, 'By appointment only. Friday hours are virtual only. The Special Supplemental Nutrition Program for Women, Infants, and Children (WIC) helps improve the health of pregnant, postpartum and breastfeeding women, as well as infants and children under 5 years old. Participants must meet income, residential and nutrition-risk eligibility requirements. ', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'MONDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'TUESDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'WEDNESDAY', 'OPEN', '8:00:00 AM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'THURSDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'FRIDAY', 'OPEN', '8:00:00 AM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.alive-inc.org/food-program-in-alexandria-virginia/', 'Alexandrians Involved Ecumenically Food Warehouse (ALIVE)', '510-F South Van Dorn Street', 'Alexandria', 'VA', '22304', 38.81196, -77.1316, '(703) 837-9300', NULL, ARRAY['20598', '22301', '22302', '22303', '22304', '22305', '22306', '22307', '22308', '22309'], NULL, 'Alexandria residents with free groceries, personal care items, cleaning supplies, school supplies, and connections to other helpful services. Neighbors are welcome to visit once a month, and proof of residency may be requested.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'TUESDAY', 'OPEN', '11:00:00 AM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'WEDNESDAY', 'OPEN', '11:00:00 AM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'THURSDAY', 'OPEN', '11:00:00 AM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'SATURDAY', 'OPEN', '9:00:00 AM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.welcometoresurrection.org/help-others', 'West End Food Pantry', '5150 Fillmore Ave', 'Alexandria', 'VA', '22311', 38.83868, -77.1177, NULL, 'contact@westendfoodpantry.com', ARRAY['22312', '22311', '22302', '22304', '22206', '22314', '22305', '22301'], NULL, 'The West End Food Pantry is located in the double garage of the Mission House of St. James United Methodist Church at 5150 Fillmore Avenue. This site is between North Beauregard Street and Seminary Road, across Fillmore Avenue from the Alexandria Campus of the Northern Virginia Community College. The pantry is open from 5:00 to 6:30 pm on Monday nights, except on days when the City of Alexandria Public Schools are closed due to inclement weather. All City of Alexandria residents may receive free food when the pantry is open. Those wishing to receive food need only bring proof of residency and show up. The pantry does not report the identity of its clientele to anyone.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'MONDAY', 'OPEN', '5:00:00 PM', '6:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://springfield-christianchurch.org/', 'Springfield Christian Church', '5407 Backlick Rd', 'Springfield', 'VA', '22151', 38.80419, -77.1834, '(703) 354-4994', 'secretary@springfield-christianchurch.org', ARRAY['ANY'], NULL, 'Requires registration during your first visit; subsequent visits require you to sign up.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'THURSDAY', 'OPEN', '1:30:00 PM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.alive-inc.org/food-program-in-alexandria-virginia/', 'ALIVE! Community Fresh Market: William Ramsay Recreation Center', '5650 Sanger Avenue', 'Alexandria', 'VA', '22311', 38.82733, -77.1304, '(703) 837-9300', NULL, ARRAY['20598', '22301', '22302', '22303', '22304', '22305', '22306', '22307', '22308', '22309'], CAST ( ARRAY['NONE'] AS supported_diet[] ), 'ALIVE! distributes free bags of groceries (produce, chicken, eggs, bread) at multiple locations on the LAST Saturday of the month from 8:30 am – 10:30 am. Please bring reusable bags. ALIVE! food distributions are for City of Alexandria residents. Proof of Alexandria City residency may be requested.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (49, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (49, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (49, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (49, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (49, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (49, 'SATURDAY', 'OPEN', '8:30:00 AM', '10:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (49, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Chelsea Square', '5800 Backlick Rd', 'Springfield', 'VA', '22150', 38.79289, -77.187, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. St. Mark’s Lutheran Church, 5800 Backlick Road, in the basement of Fellowship Hall, on side adjacent to Chelsea Square Apartments. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.

', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (50, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (50, 'TUESDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (50, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (50, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (50, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (50, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (50, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Willston', '6134 Willston Dr', 'Seven Corners', 'VA', '22044', 38.8714, -77.148, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. In front of Building #6134 Willston Garden Apartments. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'TUESDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'THURSDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Patrick Henry', '6195 Greenwood Dr', 'Seven Corners', 'VA', '22044', 38.86609, -77.1495, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Near Building #6195. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'TUESDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'THURSDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Springfield Gardens', '7224 Commerce St', 'Springfield', 'VA', '22150', 38.78182, -77.1907, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Community Center behind Springfield Plaza at 7224 Commerce Street, opposite SunTrust Bank. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'FRIDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.fairfaxcounty.gov/neighborhood-community-services/resource-centers', 'Springfield/Franconia Family Resource Center', '7224 Commerce Street, Apt. T-4', 'Springfield', 'VA', '22150', 38.78173524, -77.19124955, '(703) 644-0000', NULL, ARRAY['22015', '22150', '22151', '22152', '22153', '22159'], NULL, 'Must bring your own bags. First come, first serve, and open until food runs out.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'TUESDAY', 'OPEN', '1:00:00 PM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://loudounhunger.org/', 'Loudoun Hunger Relief: Leesburg', '750 Miller Drive, Suite 110', 'Leesburg', 'VA', '20175', 39.08272509, -77.55522676, '(703) 777-5911', 'info@loudounhunger.org', ARRAY['20180', '20132', '20197', '20176', '20141', '20158', '20129', '20175', '20135', '20184', '20130', '20117', '20105', '20152', '20120', '20151', '20166', '20170', '20148', '20164', '22066', '20165', '20147', '20198'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Tuesday, Wednesday, and Thursday are by appointment only. Friday and Saturday are available for walk-ins. Must provide proof of Loudoun County residency. Closed on Tuesdays from 10:30am - 12:00pm and 2:40pm - 4:00pm; closed on Thursdays from 3:30pm - 5:00pm; closed on Fridays from 10:30am - 12:00pm.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'TUESDAY', 'OPEN', '8:30:00 AM', '5:40:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'WEDNESDAY', 'OPEN', '8:30:00 AM', '11:20:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'THURSDAY', 'OPEN', '1:00:00 PM', '6:40:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'FRIDAY', 'OPEN', '8:30:00 AM', '2:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'SATURDAY', 'OPEN', '9:00:00 AM', '11:20:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://annandalechurch.com/foodministry', 'Annandale United Methodist Church', '7901 Heritage Drive', 'Annandale', 'VA', '22003', 38.83251, -77.2108, '(703) 256-8330', 'office@annandale-umc.org', ARRAY['22003'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Important: This mission serves community members living in the 22003 Annandale zip code. Clients must register showing evidence (utility bill, driver’s license, etc.) of living in our service area. One registration card/food pickup per household per week. Persons living outside zip code 22003 will be given a small bag of food with information about other food sites in Fairfax County.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (56, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (56, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (56, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (56, 'THURSDAY', 'OPEN', '4:00:00 PM', '6:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (56, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (56, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (56, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://houseofmercyva.org/', 'House of Mercy', '8170 Flannery Ct', 'Manassas', 'VA', '20109', 38.78146, -77.5578, '(703) 659-1636', NULL, NULL, NULL, NULL, FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (57, 'MONDAY', 'OPEN', '10:00:00 AM', '4:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (57, 'TUESDAY', 'OPEN', '10:00:00 AM', '4:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (57, 'WEDNESDAY', 'OPEN', '10:00:00 AM', '4:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (57, 'THURSDAY', 'OPEN', '10:00:00 AM', '4:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (57, 'FRIDAY', 'OPEN', '10:00:00 AM', '4:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (57, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (57, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.tolministries.org/branches/food/', 'Tree of Life: Community Dinner', '850 Edwards Ferry Rd NE', 'Leesburg', 'VA', '20176', 39.11364, -77.5462, '(540) 441-7920', 'info@tolministries.org', ARRAY['ANY'], NULL, 'Join us every TUESDAY evening for a sit down FREE MEAL. We are on site serving meals starting at 6:00PM until supplies last.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (58, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (58, 'TUESDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (58, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (58, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (58, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (58, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (58, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.capitalareafoodbank.org/what-we-do/direct-food-distribution-programs/community-marketplaces/', 'Capital Area Food Bank: Glenarden Community Center', '8615 McLain Ave Suite A', 'Glenarden', 'MD', '20706', 38.93038998, -76.86647499, '(202) 644-9807', 'hungerlifeline@capitalareafoodbank.org', NULL, CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Only open on the THIRD Saturday of each month. Participating in a Community Marketplace is simple. We recommend arriving to your area’s marketplace around 9 a.m. on the day of the distribution, with a container to hold your produce. We suggest a reusable shopping bag or a rolling cart. Stop by the registration desk and fill out the registration form, which asks for contact information, household information, and a few other details. Once that’s finished, we’ll give you a key card, just like the ones you get at a grocery store. Keep this key card and bring it to every Community Marketplace that you attend to enter the marketplace.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (59, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (59, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (59, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (59, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (59, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (59, 'SATURDAY', 'OPEN', '8:30:00 AM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (59, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.capitalareafoodbank.org/what-we-do/direct-food-distribution-programs/community-marketplaces/', 'Capital Area Food Bank: Arlington Community Marketplace', '909 S Dinwiddie St', 'Arlington', 'VA', '22204', 38.85638, -77.1122, '(202) 644-9807', 'hungerlifeline@capitalareafoodbank.org', NULL, CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Only open on the FOURTH Saturday of each month. Participating in a Community Marketplace is simple. We recommend arriving to your area’s marketplace around 9 a.m. on the day of the distribution, with a container to hold your produce. We suggest a reusable shopping bag or a rolling cart. Stop by the registration desk and fill out the registration form, which asks for contact information, household information, and a few other details. Once that’s finished, we’ll give you a key card, just like the ones you get at a grocery store. Keep this key card and bring it to every Community Marketplace that you attend to enter the marketplace.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (60, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (60, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (60, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (60, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (60, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (60, 'SATURDAY', 'OPEN', '8:30:00 AM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (60, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.tolministries.org/branches/food/', 'Tree of Life: Community Dinner', '9109 John S Mosby Hwy', 'Upperville', 'VA', '20184', 38.99372, -77.8826, '(540) 441-7920', 'info@tolministries.org', ARRAY['ANY'], NULL, 'Join us the THIRD WEDNESDAY of every month for a sit down FREE MEAL.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (61, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (61, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (61, 'WEDNESDAY', 'OPEN', '5:30:00 PM', '6:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (61, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (61, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (61, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (61, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.saintgeorgeschurch.org/foodpantry', 'Saint George''s Episcopal Church ', '915 N. Oakland Street', 'Arlington', 'VA', '22203', 38.88252, -77.1043, '(703) 525-8286', 'info@saintgeorgeschurch.org', NULL, NULL, NULL, FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (62, 'MONDAY', 'OPEN', '12:00:00 PM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (62, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (62, 'WEDNESDAY', 'OPEN', '12:00:00 PM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (62, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (62, 'FRIDAY', 'OPEN', '12:00:00 PM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (62, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (62, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.ststephensfairfax.org/get-involved/food-clothing-donations/', 'St. Stephen''s United Methodist Church: First Fridays/Green Groceries', '9203 Braddock Road', 'Burke', 'VA', '22015', 38.80958391, -77.26283641, '(703) 978-8724', NULL, ARRAY['ANY'], NULL, 'Only open on the FIRST Friday of each month. First Friday/Green Groceries provides free, fresh produce from the Capital Area Food Bank to our neighbors in need. It is held on the first Friday of each month as a drive-thru event in the parking lot at St. Stephen’s. The drive-thru begins at 5 p.m. and lasts until 6 p.m. or sooner if we no longer have food available. All are welcome and no pre-registration is required. Our next distribution dates are November 7 and December 5.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (63, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (63, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (63, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (63, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (63, 'FRIDAY', 'OPEN', '5:00:00 PM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (63, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (63, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://www.ststephensfairfax.org/get-involved/food-clothing-donations/', 'St. Stephen''s United Methodist Church: Grace Ministries', '9203 Braddock Road', 'Burke', 'VA', '22015', 38.80958391, -77.26283641, '(703) 978-8724', NULL, ARRAY['ANY'], NULL, 'Only open on the FOURTH Saturday of each month.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (64, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (64, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (64, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (64, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (64, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (64, 'SATURDAY', 'OPEN', '7:00:00 AM', '9:00:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (64, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://alimanislamiccenter.org/services/', 'Al Aman Masjid', '9502 Richmond Hwy.', 'Lorton', 'VA', '22079', 38.70117, -77.2104, '(703) 688-3135', 'contact@alimansite.org', NULL, NULL, 'Food pantry is open the THIRD Friday of every month. Al Iman is a registered non-profit organization based in Lorton, VA, aimed at serving the Muslim community and beyond.', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (65, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (65, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (65, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (65, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (65, 'FRIDAY', 'OPEN', '1:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (65, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (65, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://lortonaction.org/food-pantry/', 'Lorton Community Action Center', '9520 Richmond Hwy', 'Lorton', 'VA', '22079', 38.69815, -77.2142, '(703) 339-5161', 'info@lortonaction.org', ARRAY['22079', '22060'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'The LCAC food pantry serves individuals and families in Lorton. Registered clients are eligible to attend one of three distributions each week, where they select food and other items for their families. We distribute fruits, vegetables, bread, meat, cereal, a wide range of non-perishable food, and much more. Register Here: https://lortonaction.org/register-for-services/', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (66, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (66, 'TUESDAY', 'OPEN', '4:00:00 PM', '7:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (66, 'WEDNESDAY', 'OPEN', '11:00:00 AM', '5:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (66, 'THURSDAY', 'OPEN', '10:00:00 AM', '12:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (66, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (66, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (66, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Fairfax', '9753 Alwaes Dr', 'Fairfax', 'VA', '22031', 38.86818, -77.282, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Parking lot of Yorkville Apartments, facing Kingsbridge. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (67, 'MONDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (67, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (67, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (67, 'THURSDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (67, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (67, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (67, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Ellison', 'Ellison St & Irving St', 'Falls Church', 'VA', '22046', 38.8884344, -77.18431047, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (68, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (68, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (68, 'WEDNESDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (68, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (68, 'FRIDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (68, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (68, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Barcroft', 'S Four Mile Run Dr & Columbia Pike', 'Arlington', 'VA', '22204', 38.85634, -77.1099, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Park & Ride site, corner of Columbia Pike & Four Mile Run Drive/South Buchanan Street, Arlington. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.

', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (69, 'MONDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (69, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (69, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (69, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (69, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (69, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (69, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ('https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: S. Dickerson ', 'S. Dickerson St & 8th Rd S', 'Arlington', 'VA', '22204', 38.85861896, -77.11483812, '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Parking lot of high-rise apartment on S. Dickerson St., just off 8th Road, Arlington. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.

', FALSE)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (70, 'MONDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (70, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (70, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (70, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (70, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (70, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (70, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;
