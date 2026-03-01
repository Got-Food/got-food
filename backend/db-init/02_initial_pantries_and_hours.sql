INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (1, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Summit Oaks', '10550 Oak Bluff Ct', 'Burke', '22015', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', '2026-02-28 23:41:39.696421')
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
VALUES (1, 'THURSDAY', 'OPEN', '6:30:00 PM', NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (2, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Crevenna Oak', '10955 Crevenna Oak Dr', 'Burke', '22015', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. In the parking lot of the specified address. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', '2026-02-28 23:41:39.696470')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (2, 'THURSDAY', 'OPEN', '6:00:00 PM', '7:00:00 PM')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (3, 'https://ccda.net/find-help/food/sterling-food-pantry/', 'Catholic Charities Loudoun Regional Office (LRO)', '113 Executive Drive, Building #2, Suite 110', 'Sterling', '20166', '(703) 443-6693', 'LROpantry@ccda.net', NULL, NULL, 'Clients are eligible to receive food once every 30 days. Picture ID and Proof of current address required at every visit.By Appointment only – schedule your appointment by using this link: https://food-pantry-appointment.as.me/schedule/dd935c2f', '2026-02-28 23:41:39.696495')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'MONDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'TUESDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'WEDNESDAY', 'OPEN', '10:00:00 AM', '12:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'THURSDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (3, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (4, 'https://www.tolministries.org/branches/food/', 'Tree of Life: Community Dinner', '115 East Main Street', 'Purcellville', '20132', '(540) 441-7920', 'info@tolministries.org', ARRAY['ANY'], NULL, 'Join us every THURSDAY evening for a sit-down FREE MEAL. We are on site serving meals starting at 5:30 pm until supplies last.', '2026-02-28 23:41:39.696519')
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
VALUES (4, 'THURSDAY', 'OPEN', '5:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (4, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (4, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (4, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (5, 'https://www.tolministries.org/food-pantry/', 'Tree of Life: Western Loudoun Pantry', '115 East Main Street', 'Purcellville', '20132', '(540) 441-7920', 'info@tolministries.org', ARRAY['20180', '20132', '20197', '20176', '20141', '20158', '20129', '20175', '20135', '20184', '20130', '20117', '20105', '20152', '20120', '20151', '20166', '20170', '20148', '20164', '22066', '20165', '20147', '20198', '20130', '20135', '22611', '22620', '22663', '20130', '20185'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Serving All of Loudoun + Northern Fauquier and Clarke Counties. Tree of Life''s Food Pantries provide free groceries to those in need.  Once a month, those in need can call in to request food and receive two to three weeks'' worth of groceries from one our regional Food Pantries. In most cases, we are able to deliver the food directly to the home of the person in need. Consideration is given to food preferences and allergies.', '2026-02-28 23:41:39.696547')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'MONDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'TUESDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'WEDNESDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'THURSDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'FRIDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (5, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (6, 'https://www.tolministries.org/branches/food/', 'Tree of Life: Community Dinner', '120 Enterprise St', 'Sterling', '20164', '(540) 441-7920', 'info@tolministries.org', ARRAY['ANY'], NULL, 'Join us every TUESDAY evening for a sit down FREE MEAL. We are on site serving meals starting at 6:30PM until supplies last.', '2026-02-28 23:41:39.696574')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'TUESDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (6, 'THURSDAY', 'CLOSED', NULL, NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (7, 'https://www.capitalareafoodbank.org/what-we-do/direct-food-distribution-programs/community-marketplaces/', 'Capital Area Food Bank: Southgate Community Center', '12125 Pinecrest Rd', 'Reston', '20191', '(202) 644-9807', 'hungerlifeline@capitalareafoodbank.org', NULL, CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Only open on the SECOND Saturday of each month. Participating in a Community Marketplace is simple. We recommend arriving to your area’s marketplace around 9 a.m. on the day of the distribution, with a container to hold your produce. We suggest a reusable shopping bag or a rolling cart. Stop by the registration desk and fill out the registration form, which asks for contact information, household information, and a few other details. Once that’s finished, we’ll give you a key card, just like the ones you get at a grocery store. Keep this key card and bring it to every Community Marketplace that you attend to enter the marketplace.', '2026-02-28 23:41:39.696597')
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
VALUES (7, 'SATURDAY', 'OPEN', '8:30:00 AM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (7, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (8, 'https://cho-va.com/', 'Committee for Helping Others', '124 Park St. NE', 'Vienna', '22180', '(703) 281-7614', 'cho@cho-va.com', ARRAY['22180', '22181', '22182', '22183', '22185', '22124', '22027', '22081', '22082', '22116', '22118', '22119'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Vienna, Oakton, Dunn Loring, and Merrifield Residents. If you want to pick up food, you must make an appointment; call 703-281-7614. We provide “emergency” food, not long-term food service.', '2026-02-28 23:41:39.696620')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'MONDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'TUESDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'WEDNESDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'THURSDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'FRIDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'SATURDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (8, 'SUNDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (9, 'https://penderumc.org/pender-blog/helping-our-neighbors-through-penders-mini-food-pantry/', 'Pender Mini Food Pantry', '12401 Alder Woods Drive', 'Fairfax', '22033', '(703) 278-8023', 'church.office@penderumc.org', ARRAY['ANY'], CAST ( ARRAY['NONE'] AS supported_diet[] ), 'A small take-what-you-need food pantry. Open 24/7.', '2026-02-28 23:41:39.696640')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'MONDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'TUESDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'WEDNESDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'THURSDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'FRIDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'SATURDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (9, 'SUNDAY', 'OPEN', '12:00:00 AM', '11:59:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (10, 'https://www.njlclovettsville.org/food-pantry', 'Western Loudoun Food Pantry', '12942 Lutheran Church Rd.', 'Lovettsville', '20180', '(540) 822-5576', ' officenjlc@gmail.com', ARRAY['ANY'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Shopping-style food pantry. Appointments also available outside of open hours. We require no proof of residency or eligibility. We seek to work with our community based on the honor system. If you truly have a need, we want to help as we are able. We only ask for your last name for inventory purposes.', '2026-02-28 23:41:39.696665')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'WEDNESDAY', 'OPEN', '2:00:00 PM', '5:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (10, 'THURSDAY', 'CLOSED', NULL, NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (11, 'https://search.211virginia.org/search/ce8758da-1093-5dba-ae56-f013ebbf8bbe', 'Catholic Charities Christ House', '131 South West Street', 'Alexandria', '22314', '(703) 549-8644', 'ChristHouse@ccda.net', NULL, NULL, 'The Christ House offers an Evening Meal each night of the year.   The dinners are to-go meals and can be picked up every night, in all weather conditions, from 5 to 5:30 p.m.', '2026-02-28 23:41:39.696684')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'MONDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'TUESDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'WEDNESDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'THURSDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'FRIDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'SATURDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (11, 'SUNDAY', 'OPEN', '5:00:00 PM', '5:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (12, 'https://www.gohopenova.org/', 'Grains of Hope', '13224 Franklin Farm Rd', 'Herndon', '20171', '(703) 620-1977', 'food@cofumc.org ', ARRAY['ANY'], NULL, 'No registration needed.  Neighbors often begin arriving as early as 2:00 PM to get in line, but distribution does not begin until 4:00 PM.', '2026-02-28 23:41:39.696702')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'TUESDAY', 'OPEN', '4:00:00 PM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (12, 'THURSDAY', 'CLOSED', NULL, NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (13, 'https://www.florisumc.org/wp-content/uploads/2025/12/2026-Distribution-Flyer-1.pdf', 'Floris United Methodist Church', '13600 Frying Pan Rd', 'Herndon', '20171', '(703) 793-0026', 'floris@florisumc.org', ARRAY['ANY'], NULL, 'Only open on the FIRST Saturday of each month. Must bring proof of Virginia residency. Lines typically begin to form at 7:30am.', '2026-02-28 23:41:39.696720')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'SATURDAY', 'OPEN', '8:00:00 AM', '9:00:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (13, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (14, 'https://www.capitalareafoodbank.org/what-we-do/direct-food-distribution-programs/community-marketplaces/', 'Capital Area Food Bank: Rosedale Recreation Center', '1701 Gales Street NE Ward 7 ', 'Washington', '20002', '(202) 644-9807', 'hungerlifeline@capitalareafoodbank.org', NULL, CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Only open on the FIRST Saturday of each month. Participating in a Community Marketplace is simple. We recommend arriving to your area’s marketplace around 9 a.m. on the day of the distribution, with a container to hold your produce. We suggest a reusable shopping bag or a rolling cart. Stop by the registration desk and fill out the registration form, which asks for contact information, household information, and a few other details. Once that’s finished, we’ll give you a key card, just like the ones you get at a grocery store. Keep this key card and bring it to every Community Marketplace that you attend to enter the marketplace.', '2026-02-28 23:41:39.696762')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'SATURDAY', 'OPEN', '8:30:00 AM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (14, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (15, 'https://loudounhunger.org/', 'Loudoun Hunger Relief: Sterling', '18 Export Dr.', 'Sterling', '20164', '(703) 777-5911', 'info@loudounhunger.org', ARRAY['20180', '20132', '20197', '20176', '20141', '20158', '20129', '20175', '20135', '20184', '20130', '20117', '20105', '20152', '20120', '20151', '20166', '20170', '20148', '20164', '22066', '20165', '20147', '20199'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'By appointment only. Must provide proof of Loudoun County residency. See website for details.', '2026-02-28 23:41:39.696788')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'MONDAY', 'OPEN', '12:30:00 PM', '2:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (15, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (16, 'https://mapping.littlefreepantry.org/pantry/3084', 'Little Yellow Free Pantry', '203 S Fillmore St', 'Arlington', '22204', NULL, 'kindnessactivist@gmail.com', ARRAY['ANY'], CAST ( ARRAY['NONE'] AS supported_diet[] ), 'A small, standalone pantry that offers canned goods, toiletries, and other nonperishables.', '2026-02-28 23:41:39.696807')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (17, 'https://www.unitedcommunity.org/programs/food-assistance-programs/', 'Community Mobile Market: Walt Whitman Middle School', '2500 Parkers Lane', 'Alexandria', '22306', '(703) 660-2464', 'info@unitedcommunity.org', ARRAY['22303', '22306', '22307', '22308', '22309', '22310'], NULL, 'Open on the FIRST Wednesday of each month. Please bring the following when registering for food assistance: Universal Intake/TEFAP Form; Photo ID for all adults and birth certificates for children under 18; Proof of Address (e.g., lease or utility bill); Proof of Income -- two recent pay stubs or income letter from employer; documentation of any other income assistance (SSI, SSDI, TANF, SNAP, child support)', '2026-02-28 23:41:39.696828')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (17, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (17, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (17, 'WEDNESDAY', 'OPEN', '3:00:00 PM', '4:00:00 PM')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (18, 'https://www.alive-inc.org/food-program-in-alexandria-virginia/', 'Alexandrians Involved Ecumenically Food Warehouse (ALIVE)', '2601 Mount Vernon Avenue', 'Alexandria', '22301', '(703) 837-9300', NULL, ARRAY['20598', '22301', '22302', '22303', '22304', '22305', '22306', '22307', '22308', '22310'], NULL, 'Alexandria residents with free groceries, personal care items, cleaning supplies, school supplies, and connections to other helpful services. Neighbors are welcome to visit once a month, and proof of residency may be requested.', '2026-02-28 23:41:39.696848')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'TUESDAY', 'OPEN', '12:00:00 PM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'WEDNESDAY', 'OPEN', '12:00:00 PM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'THURSDAY', 'OPEN', '12:00:00 PM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'SATURDAY', 'OPEN', '9:00:00 AM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (18, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (19, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Gunston', '2700 S Lang St', 'Arlington', '22206', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Gunston Community Center, 2700 South Lang Street, at Gunston Middle School, entrance near soccer field, Arlington. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.

', '2026-02-28 23:41:39.696872')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (19, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (19, 'TUESDAY', 'OPEN', '6:00:00 PM', NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (20, 'https://www.ourladyqueenofpeace.org/food-pantry.html', 'Our Lady Queen of Peace', '2700 South 19th Street', 'Arlington', '22204', '(703) 979-5580', 'sdiazwells@olqpva.org', NULL, NULL, NULL, '2026-02-28 23:41:39.696890')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'WEDNESDAY', 'OPEN', '9:00:00 AM', '11:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (20, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (21, 'https://afac.org/', 'Arlington Food Asistance Center', '2708 S. Nelson Street', 'Arlington', '22206', '(703) 845-8486', 'clientservices@afac.org', ARRAY['22101', '22213', '22207', '22205', '22201', '22209', '22203', '22204', '22206', '22211', '20301', '22202', '20001'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Must live in Arlington and get a referral from an Arlington County social service agency.', '2026-02-28 23:41:39.696910')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'MONDAY', 'OPEN', '9:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'TUESDAY', 'OPEN', '6:00:00 PM', '7:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'WEDNESDAY', 'OPEN', '9:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'THURSDAY', 'OPEN', '6:00:00 PM', '7:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'FRIDAY', 'OPEN', '9:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'SATURDAY', 'OPEN', '8:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (21, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (22, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Hollywood', '2802 Hollywood Road', 'Falls Church', '22043', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Parking lot of Wexford Manor Apartments, south of Savannah Street, Falls Church. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', '2026-02-28 23:41:39.696930')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'WEDNESDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'FRIDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (22, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (23, 'https://www.sterlingumc.org/grace', 'Sterling UMC', '304 East Church Rd', 'Sterling', '20164', '(703) 430-6455', 'grace.sumc@gmail.com', NULL, NULL, 'Only open on the SECOND Saturday of each month. ', '2026-02-28 23:41:39.696948')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'SATURDAY', 'OPEN', '8:00:00 AM', '10:00:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (23, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (24, 'https://hijrah.org/donations/food-bank-2/', 'Dar Al-Hijrah Islamic Center', '3159 Row Street', 'Falls Church', '22044', '(703) 536-1030', 'socialservices@hijrah.org', ARRAY['20598', '22201', '22202', '22203', '22204', '22205', '22206', '22207', '22209', '22210', '20151', '20152', '20153', '20598', '22030', '22031', '22032', '22033', '22034', '22035', '22003', '20598', '22301', '22302', '22303', '22304', '22305', '22306', '22307', '22308', '22309'], CAST ( ARRAY['HALAL'] AS supported_diet[] ), 'Requires registration. The DAH Food Bank distributes fresh produce and halal chicken every Thursday morning from 9:00am until 11:00am, or when the food runs out. All who are in need are welcome to register for our food bank regardless of their faith, background or legal status.
', '2026-02-28 23:41:39.696975')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'THURSDAY', 'OPEN', '9:00:00 AM', '11:00:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (24, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (25, 'https://www.meadechurch.org/default.asp', 'Meade Memorial Episcopal Bag Lunch Program', '322 N. Alfred Street', 'Alexandria', '22314', '(703) 549-1334', NULL, NULL, NULL, 'Availability listed for Saturday only applies for October through April.', '2026-02-28 23:41:39.696993')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'MONDAY', 'OPEN', '11:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'TUESDAY', 'OPEN', '11:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'WEDNESDAY', 'OPEN', '11:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'THURSDAY', 'OPEN', '11:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'FRIDAY', 'OPEN', '11:30:00 AM', '12:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'SATURDAY', 'OPEN', '12:30:00 PM', '1:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (25, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (26, 'https://www.arha.us/youth-and-family-programs', 'Ruby Tucker Family Center Food Pantry', '322 Tancil Ct', 'Alexandria', '22314', '(703) 535-3175', 'info@arha.us', NULL, NULL, 'Open on the SECOND Friday of the month.', '2026-02-28 23:41:39.697010')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'FRIDAY', 'OPEN', '10:30:00 AM', '12:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (26, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (27, 'https://columbia.church/join-the-mission/local/food-pantry/', 'Columbia Food Pantry', '3245 Glen Carlyn Road', 'Falls Church', '22041', '7035345700', 'foodpantry@columbia.church', ARRAY['ANY'], NULL, 'We do not require referrals or check IDs. Anyone is welcome each Saturday, between 9:00 am and 10:30 am. Clients generally receive 15-20 non-perishable and fresh produce.', '2026-02-28 23:41:39.697027')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'SATURDAY', 'OPEN', '9:00:00 AM', '10:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (27, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (28, 'https://www.fairfaxcounty.gov/neighborhood-community-services/resource-centers', 'Culmore Family Resource Center', '3304-B Culmore Court', 'Falls Church', '22041', '(703) 379-5217', NULL, ARRAY['22041', '22042', '22043', '22044', '22046'], NULL, 'Bring your own bags. Use the basement entrance. You should arrive by 12:00pm - 12:30pm to wait in line, as they typically form well before the pantry hours. Call the listed phone number for questions.', '2026-02-28 23:41:39.697046')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'THURSDAY', 'OPEN', '1:00:00 PM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (28, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (29, 'https://www.stanthonyparish.org/food-pantry/', 'St. Anthony of Padua Catholic Church', '3305 Glen Carlyn Rd. ', 'Falls Church', '22041', '(703) 820-7111', 'office@stanthonyparish.org', NULL, NULL, 'St. Anthony’s provides food assistance to those in need in our community. The Food Pantry operates two days a week (Monday and Wednesday) from 10am to 1pm. If you are new to the food pantry, registration for new members is only available on Wednesdays. It is only closed if Monday or Wednesday are federal holidays. Please arrive as early as possible, dependent on wait times, if arriving near closing time at 1pm, service is not guaranteed. Each Saturday morning, a team of volunteers also packages meals for day laborers in our community. When finances permit, some financial support for rent and other emergency expenses is also provided to deserving individuals.', '2026-02-28 23:41:39.697083')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'MONDAY', 'OPEN', '10:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'WEDNESDAY', 'OPEN', '10:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (29, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (30, 'https://www.culmoreumc.org/food--clothing-ministry.html', 'Culmore United Methodist Church', '3400 Charles Street', 'Falls Church', '22041', '(703) 820-5131', 'culmoreumc@vacoxmail.com', NULL, NULL, 'In partnership with the Capital Area Food Bank operates “the mobile food pantry” in our church parking lot.  Culmore Church members and volunteers from the local community distribute tens of thousands of pounds of fresh produce to over two hundred neighborhood families. The food pantry is held every 2nd Friday of each month. In addition to the mobile food pantry, Culmore Church partners with Grace Ministries (of the United Methodist Church) with funding from Fairfax County, on the fourth Friday of each month to distribute packages of food and clothing one hundred needy households. Culmore UMC also maintains a food pantry for drop-ins who are running low on food. The pantry stocks essential non perishable foodstuffs as well as a limited array of frozen food to ensure that no one in need walks away without something to eat. Culmore Church also operates a daily food rescue pantry from the Church office. The pantry is stocked with basic supplies of non-perishable consumer packaged foods; staples like beans and rice and pasta.', '2026-02-28 23:41:39.697106')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'MONDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'TUESDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'WEDNESDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'THURSDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'FRIDAY', 'OPEN', '10:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (30, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (31, 'https://www.obcalexandria.church/ministries', 'Oakland Baptist Church Food Bank', '3408 King Street', 'Alexandria', '22302', '(703) 998-9006', 'info@obcalexandria.church', NULL, NULL, 'Open on the FIRST and THIRD Fridays every month.', '2026-02-28 23:41:39.697125')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'FRIDAY', 'OPEN', '11:00:00 AM', '12:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (31, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (32, 'https://www.alive-inc.org/food-program-in-alexandria-virginia/', 'ALIVE! Community Fresh Market: Leonard “Chick” Armstrong Recreation Center', '3600 Commonwealth Ave', 'Alexandria', '22305', '(703) 837-9300', NULL, ARRAY['20598', '22301', '22302', '22303', '22304', '22305', '22306', '22307', '22308', '22309'], CAST ( ARRAY['NONE'] AS supported_diet[] ), 'ALIVE! distributes free bags of groceries (produce, chicken, eggs, bread) at multiple locations on the LAST Saturday of the month from 8:30 am – 10:30 am. Please bring reusable bags. ALIVE! food distributions are for City of Alexandria residents. Proof of Alexandria City residency may be requested.', '2026-02-28 23:41:39.697146')
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
VALUES (32, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (32, 'SATURDAY', 'OPEN', '8:30:00 AM', '10:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (32, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (33, 'https://gracealex.org/about/our-food-pantry', 'Grace Church', '3601 Russell Road', 'Alexandria', '22305', '(703) 549-1980', NULL, ARRAY['ANY (VA)'], NULL, 'Each family may receive food twice monthly, one bag per household.', '2026-02-28 23:41:39.697169')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'TUESDAY', 'OPEN', '6:00:00 PM', '7:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'FRIDAY', 'OPEN', '6:00:00 PM', '7:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (33, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (34, 'https://www.unitedcommunity.org/programs/food-assistance-programs/', 'Community Mobile Market: Mount Vernon Woods Elementary School', '4015 Fielding St.', 'Alexandria', '22309', '(571) 255-8958', 'info@unitedcommunity.org', ARRAY['22303', '22306', '22307', '22308', '22309', '22310'], NULL, 'Open on the FIRST Monday of each month. Please bring the following when registering for food assistance: Universal Intake/TEFAP Form; Photo ID for all adults and birth certificates for children under 18; Proof of Address (e.g., lease or utility bill); Proof of Income -- two recent pay stubs or income letter from employer; documentation of any other income assistance (SSI, SSDI, TANF, SNAP, child support)', '2026-02-28 23:41:39.697189')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'MONDAY', 'OPEN', '4:00:00 PM', '5:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (34, 'THURSDAY', 'CLOSED', NULL, NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (35, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Fairmont Gardens', '4137 Wadsworth Court', 'Annandale', '22003', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Only open on the THIRD Thursday of each month. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', '2026-02-28 23:41:39.697209')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (35, 'THURSDAY', 'OPEN', '11:00:00 AM', NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (36, 'https://www.tolministries.org/food-pantry/', 'Tree of Life: Eastern Loudoun Pantry', '45189 Research Place, Building A', 'Ashburn', '20147', '(540) 441-7920', 'info@tolministries.org', ARRAY['20180', '20132', '20197', '20176', '20141', '20158', '20129', '20175', '20135', '20184', '20130', '20117', '20105', '20152', '20120', '20151', '20166', '20170', '20148', '20164', '22066', '20165', '20147', '20198', '20130', '20135', '22611', '22620', '22663', '20130', '20184'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Serving All of Loudoun + Northern Fauquier and Clarke Counties. Tree of Life''s Food Pantries provide free groceries to those in need.  Once a month, those in need can call in to request food and receive two to three weeks'' worth of groceries from one our regional Food Pantries. In most cases, we are able to deliver the food directly to the home of the person in need. Consideration is given to food preferences and allergies.', '2026-02-28 23:41:39.697234')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'MONDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'TUESDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'WEDNESDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'THURSDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'FRIDAY', 'OPEN', '9:00:00 AM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (36, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (37, 'https://www.loudoun.gov/1578/WIC-Program', 'Loudoun County WIC Program: Ashburn', '45201 Research Place, Suite 120', 'Ashburn', '20147', '(703) 777-0239', 'health@loudoun.gov', ARRAY['ANY (VA)'], NULL, 'By appointment only. Friday hours are virtual only. The Special Supplemental Nutrition Program for Women, Infants, and Children (WIC) helps improve the health of pregnant, postpartum and breastfeeding women, as well as infants and children under 5 years old. Participants must meet income, residential and nutrition-risk eligibility requirements. ', '2026-02-28 23:41:39.697259')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'MONDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'TUESDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'WEDNESDAY', 'OPEN', '8:00:00 AM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'THURSDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'FRIDAY', 'OPEN', '8:00:00 AM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (37, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (38, 'https://www.linkagainsthunger.org/get-help', 'LINK Against Hunger: Food Assistance Delivery', '46833 Harry Byrd Highway', 'Sterling', '20164', '(703) 437-1776', NULL, ARRAY['20170', '20171', '20172', '20190', '20191', '20192', '20194', '20195', '20196', '20598'], NULL, 'LINK delivers food assistance to people in the Herndon and Sterling areas of Northern, Virginia. If you have a food request, please call LINK at 703-437-1776 and leave a message. A LINK volunteer will contact you to verify your need and schedule a delivery as appropriate.  As we do not have full-time staff to provide immediate response to your messages, we thank you for your patience and understanding.', '2026-02-28 23:41:39.697279')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'MONDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'TUESDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'WEDNESDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'THURSDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'FRIDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'SATURDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (38, 'SUNDAY', 'UNKNOWN', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (39, 'https://www.linkagainsthunger.org/get-help', 'LINK Against Hunger: Mobile Food Pantry', '46833 Harry Byrd Highway', 'Sterling', '20164', '(703) 437-1776', NULL, ARRAY['ANY'], NULL, 'Direct any questions to the online "Contact Us" form -- the phone number should be used for emergencies. Every second Tuesday of the month, LINK hosts a Mobile Food Pantry in the rear parking lot of Christ the Redeemer Church, located at 46833 Harry Byrd Highway, Sterling. The event takes place from 9am until all food has been distributed.  The start time varies based on the delivery arrival. The food, generously donated by the Capital Area Food Bank, typically includes vegetables, fruits, and canned goods. There are no eligibility restrictions; all individuals who attend are welcome to receive food.', '2026-02-28 23:41:39.697300')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (39, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (39, 'TUESDAY', 'OPEN', '9:00:00 AM', NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (40, 'https://www.loudoun.gov/1578/WIC-Program', 'Loudoun County WIC Program: Leesburg', '50 Sycolin Road', 'Leesburg', '20176', '(703) 777-0239', 'health@loudoun.gov', ARRAY['ANY (VA)'], NULL, 'By appointment only. Friday hours are virtual only. The Special Supplemental Nutrition Program for Women, Infants, and Children (WIC) helps improve the health of pregnant, postpartum and breastfeeding women, as well as infants and children under 5 years old. Participants must meet income, residential and nutrition-risk eligibility requirements. ', '2026-02-28 23:41:39.697320')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'MONDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'TUESDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'WEDNESDAY', 'OPEN', '8:00:00 AM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'THURSDAY', 'OPEN', '8:00:00 AM', '4:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'FRIDAY', 'OPEN', '8:00:00 AM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (40, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (41, 'https://www.alive-inc.org/food-program-in-alexandria-virginia/', 'Alexandrians Involved Ecumenically Food Warehouse (ALIVE)', '510-F South Van Dorn Street', 'Alexandria', '22304', '(703) 837-9300', NULL, ARRAY['20598', '22301', '22302', '22303', '22304', '22305', '22306', '22307', '22308', '22309'], NULL, 'Alexandria residents with free groceries, personal care items, cleaning supplies, school supplies, and connections to other helpful services. Neighbors are welcome to visit once a month, and proof of residency may be requested.', '2026-02-28 23:41:39.697354')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'TUESDAY', 'OPEN', '11:00:00 AM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'WEDNESDAY', 'OPEN', '11:00:00 AM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'THURSDAY', 'OPEN', '11:00:00 AM', '6:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'SATURDAY', 'OPEN', '9:00:00 AM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (41, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (42, 'https://www.westendfoodpantry.com/', 'West End Food Pantry', '5150 Fillmore Ave', 'Alexandria', '22311', NULL, 'contact@westendfoodpantry.com', NULL, NULL, NULL, '2026-02-28 23:41:39.697375')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'MONDAY', 'OPEN', '5:00:00 PM', '6:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (42, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (43, 'https://southernusa.salvationarmy.org/nca/arlington-va/', 'The Salvation Army: Arlington Corps', '518 South Glebe Road', 'Arlington', '22204', '(703) 979-3380', NULL, ARRAY['20598', '22201', '22202', '22203', '22204', '22205', '22206', '22207', '22209', '22210'], NULL, 'Requires application here: https://sahelp.org/. Food distribution takes place on the FIRST and SECOND Thursday of the month, open between the specified hours, while supplies last. Closed from 11:30 - 13:30. Offers fluent Spanish speakers.', '2026-02-28 23:41:39.697394')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'THURSDAY', 'OPEN', '9:30:00 AM', '3:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (43, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (44, 'https://springfield-christianchurch.org/', 'Springfield Christian Church', '5407 Backlick Rd', 'Springfield', '22151', '(703) 354-4994', 'secretary@springfield-christianchurch.org', ARRAY['ANY'], NULL, 'Requires registration during your first visit; subsequent visits require you to sign up.', '2026-02-28 23:41:39.697411')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (44, 'THURSDAY', 'OPEN', '1:30:00 PM', '4:30:00 PM')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (45, 'https://www.alive-inc.org/food-program-in-alexandria-virginia/', 'ALIVE! Community Fresh Market: William Ramsay Recreation Center', '5650 Sanger Avenue', 'Alexandria', '22311', '(703) 837-9300', NULL, ARRAY['20598', '22301', '22302', '22303', '22304', '22305', '22306', '22307', '22308', '22309'], CAST ( ARRAY['NONE'] AS supported_diet[] ), 'ALIVE! distributes free bags of groceries (produce, chicken, eggs, bread) at multiple locations on the LAST Saturday of the month from 8:30 am – 10:30 am. Please bring reusable bags. ALIVE! food distributions are for City of Alexandria residents. Proof of Alexandria City residency may be requested.', '2026-02-28 23:41:39.697431')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'SATURDAY', 'OPEN', '8:30:00 AM', '10:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (45, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (46, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Chelsea Square', '5800 Backlick Rd', 'Springfield', '22150', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. St. Mark’s Lutheran Church, 5800 Backlick Road, in the basement of Fellowship Hall, on side adjacent to Chelsea Square Apartments. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.

', '2026-02-28 23:41:39.697453')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'TUESDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (46, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (47, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Willston', '6134 Willston Dr', 'Seven Corners', '22044', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. In front of Building #6134 Willston Garden Apartments. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', '2026-02-28 23:41:39.697476')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'TUESDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (47, 'THURSDAY', 'OPEN', '6:00:00 PM', NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (48, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Patrick Henry', '6195 Greenwood Dr', 'Seven Corners', '22044', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Near Building #6195. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', '2026-02-28 23:41:39.697496')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'TUESDAY', 'OPEN', '6:30:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (48, 'THURSDAY', 'OPEN', '6:30:00 PM', NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (49, 'https://abidingpresence.net/food', 'Abiding Presence Lutheran Church', '6304 Lee Chapel Road', 'Burke', '22015', '(703) 455-7500', 'office@abidingpresence.net', ARRAY['ANY'], NULL, 'Only open on the SECOND and FOURTH Saturdays of each month. Must arrive by 7:00am to receive pantry goods. Must be over 18. You may only pick up food for your household. Abiding Presence offers a “no questions asked” food pantry for anyone in need. This is our primary method of offering assistance. We are not able to provide rental, gas, clothing, gift card or cash assistance. ', '2026-02-28 23:41:39.697516')
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
VALUES (49, 'SATURDAY', 'OPEN', '7:00:00 AM', '10:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (49, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (50, 'https://centreville-umc.org/local-outreach/food-ministries/grace-ministries/', 'Centreville United Methodist Church', '6400 Old Centreville Rd', 'Centreville', '20121', '(703) 830-2684', NULL, NULL, NULL, 'Only open on the SECOND Saturday of each month. Lines begin to form before 7:00am. ', '2026-02-28 23:41:39.697534')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (50, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (50, 'TUESDAY', 'CLOSED', NULL, NULL)
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
VALUES (50, 'SATURDAY', 'OPEN', '7:00:00 AM', '9:30:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (50, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (51, 'https://loudounhunger.org/', 'Loudoun Hunger Relief: Mobile Market', '65 Sugarland Run Dr.', 'Sterling', '20164', '(703) 777-5911', 'info@loudounhunger.org', ARRAY['20180', '20132', '20197', '20176', '20141', '20158', '20129', '20175', '20135', '20184', '20130', '20117', '20105', '20152', '20120', '20151', '20166', '20170', '20148', '20164', '22066', '20165', '20147', '20200'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'No appointment required. First come, first served, while supplies last. End time is subject to food availability.', '2026-02-28 23:41:39.697557')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (51, 'THURSDAY', 'OPEN', '10:00:00 AM', NULL)
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (52, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Springfield Gardens', '7224 Commerce St', 'Springfield', '22150', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Community Center behind Springfield Plaza at 7224 Commerce Street, opposite SunTrust Bank. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', '2026-02-28 23:41:39.697577')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'TUESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'FRIDAY', 'OPEN', '6:00:00 PM', NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (52, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (53, 'https://www.fairfaxcounty.gov/neighborhood-community-services/resource-centers', 'Springfield/Franconia Family Resource Center', '7224 Commerce Street, Apt. T-4', 'Springfield', '22150', '(703) 644-0000', NULL, ARRAY['22015', '22150', '22151', '22152', '22153', '22159'], NULL, 'Must bring your own bags. First come, first serve, and open until food runs out.', '2026-02-28 23:41:39.697596')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'TUESDAY', 'OPEN', '1:00:00 PM', '2:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'WEDNESDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'THURSDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (53, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (54, 'https://loudounhunger.org/', 'Loudoun Hunger Relief: Leesburg', '750 Miller Drive, Suite 110', 'Leesburg', '20175', '(703) 777-5911', 'info@loudounhunger.org', ARRAY['20180', '20132', '20197', '20176', '20141', '20158', '20129', '20175', '20135', '20184', '20130', '20117', '20105', '20152', '20120', '20151', '20166', '20170', '20148', '20164', '22066', '20165', '20147', '20198'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Tuesday, Wednesday, and Thursday are by appointment only. Friday and Saturday are available for walk-ins. Must provide proof of Loudoun County residency. Closed on Tuesdays from 10:30am - 12:00pm and 2:40pm - 4:00pm; closed on Thursdays from 3:30pm - 5:00pm; closed on Fridays from 10:30am - 12:00pm.', '2026-02-28 23:41:39.697617')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'MONDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'TUESDAY', 'OPEN', '8:30:00 AM', '5:40:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'WEDNESDAY', 'OPEN', '8:30:00 AM', '11:20:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'THURSDAY', 'OPEN', '1:00:00 PM', '6:40:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'FRIDAY', 'OPEN', '8:30:00 AM', '2:30:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'SATURDAY', 'OPEN', '9:00:00 AM', '11:20:00 AM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (54, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (55, 'https://www.unitedcommunity.org/programs/cynthia-hull-food-pantry/', 'Cynthia Hull Food Pantry', '7511 Fordson Road', 'Alexandria', '22306', '(703) 768-7106', 'info@unitedcommunity.org', ARRAY['22303', '22306', '22307', '22308', '22309', '22310'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Please bring the following when registering for food assistance: Universal Intake/TEFAP Form; Photo ID for all adults and birth certificates for children under 18; Proof of Address (e.g., lease or utility bill); Proof of Income -- two recent pay stubs or income letter from employer; documentation of any other income assistance (SSI, SSDI, TANF, SNAP, child support)', '2026-02-28 23:41:39.697650')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'MONDAY', 'OPEN', '10:00:00 AM', '1:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'TUESDAY', 'OPEN', '12:00:00 PM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'WEDNESDAY', 'OPEN', '2:00:00 PM', '5:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'THURSDAY', 'OPEN', '12:00:00 PM', '3:00:00 PM')
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'FRIDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'SATURDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES (55, 'SUNDAY', 'CLOSED', NULL, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (56, 'https://annandalechurch.com/foodministry', 'Annandale United Methodist Church', '7901 Heritage Drive', 'Annandale', '22003', '(703) 256-8330', 'office@annandale-umc.org', ARRAY['22003'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Important: This mission serves community members living in the 22003 Annandale zip code. Clients must register showing evidence (utility bill, driver’s license, etc.) of living in our service area. One registration card/food pickup per household per week. Persons living outside zip code 22003 will be given a small bag of food with information about other food sites in Fairfax County.', '2026-02-28 23:41:39.697675')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (57, 'https://houseofmercyva.org/', 'House of Mercy', '8170 Flannery Ct', 'Manassas', '20109', '(703) 659-1636', NULL, NULL, NULL, NULL, '2026-02-28 23:41:39.697692')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (58, 'https://www.tolministries.org/branches/food/', 'Tree of Life: Community Dinner', '850 Edwards Ferry Rd NE', 'Leesburg', '20176', '(540) 441-7920', 'info@tolministries.org', ARRAY['ANY'], NULL, 'Join us every TUESDAY evening for a sit down FREE MEAL. We are on site serving meals starting at 6:00PM until supplies last.', '2026-02-28 23:41:39.697710')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (59, 'https://www.capitalareafoodbank.org/what-we-do/direct-food-distribution-programs/community-marketplaces/', 'Capital Area Food Bank: Glenarden Community Center', '8615 McLain Ave Suite A', 'Glenarden', '20706', '(202) 644-9807', 'hungerlifeline@capitalareafoodbank.org', NULL, CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Only open on the THIRD Saturday of each month. Participating in a Community Marketplace is simple. We recommend arriving to your area’s marketplace around 9 a.m. on the day of the distribution, with a container to hold your produce. We suggest a reusable shopping bag or a rolling cart. Stop by the registration desk and fill out the registration form, which asks for contact information, household information, and a few other details. Once that’s finished, we’ll give you a key card, just like the ones you get at a grocery store. Keep this key card and bring it to every Community Marketplace that you attend to enter the marketplace.', '2026-02-28 23:41:39.697737')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (60, 'https://www.capitalareafoodbank.org/what-we-do/direct-food-distribution-programs/community-marketplaces/', 'Capital Area Food Bank: Arlington Community Marketplace', '909 S Dinwiddie St', 'Arlington', '22204', '(202) 644-9807', 'hungerlifeline@capitalareafoodbank.org', NULL, CAST ( ARRAY['ANY'] AS supported_diet[] ), 'Only open on the FOURTH Saturday of each month. Participating in a Community Marketplace is simple. We recommend arriving to your area’s marketplace around 9 a.m. on the day of the distribution, with a container to hold your produce. We suggest a reusable shopping bag or a rolling cart. Stop by the registration desk and fill out the registration form, which asks for contact information, household information, and a few other details. Once that’s finished, we’ll give you a key card, just like the ones you get at a grocery store. Keep this key card and bring it to every Community Marketplace that you attend to enter the marketplace.', '2026-02-28 23:41:39.697763')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (61, 'https://www.tolministries.org/branches/food/', 'Tree of Life: Community Dinner', '9109 John S Mosby Hwy', 'Upperville', '20184', '(540) 441-7920', 'info@tolministries.org', ARRAY['ANY'], NULL, 'Join us the THIRD WEDNESDAY of every month for a sit down FREE MEAL.', '2026-02-28 23:41:39.697781')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (62, 'https://www.saintgeorgeschurch.org/foodpantry', 'Saint George''s Episcopal Church ', '915 N. Oakland Street', 'Arlington', '22203', '(703) 525-8286', 'info@saintgeorgeschurch.org', NULL, NULL, NULL, '2026-02-28 23:41:39.697797')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (63, 'https://www.ststephensfairfax.org/get-involved/food-clothing-donations/', 'St. Stephen''s United Methodist Church: First Fridays/Green Groceries', '9203 Braddock Road', 'Burke', '22015', '(703) 978-8724', NULL, ARRAY['ANY'], NULL, 'Only open on the FIRST Friday of each month. First Friday/Green Groceries provides free, fresh produce from the Capital Area Food Bank to our neighbors in need. It is held on the first Friday of each month as a drive-thru event in the parking lot at St. Stephen’s. The drive-thru begins at 5 p.m. and lasts until 6 p.m. or sooner if we no longer have food available. All are welcome and no pre-registration is required. Our next distribution dates are November 7 and December 5.', '2026-02-28 23:41:39.697818')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (64, 'https://www.ststephensfairfax.org/get-involved/food-clothing-donations/', 'St. Stephen''s United Methodist Church: Grace Ministries', '9203 Braddock Road', 'Burke', '22015', '(703) 978-8724', NULL, ARRAY['ANY'], NULL, 'Only open on the FOURTH Saturday of each month.', '2026-02-28 23:41:39.697836')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (65, 'https://alimanislamiccenter.org/services/', 'Al Aman Masjid', '9502 Richmond Hwy.', 'Lorton', '22079', '(703) 688-3135', 'contact@alimansite.org', NULL, NULL, 'Food pantry is open the THIRD Friday of every month. Al Iman is a registered non-profit organization based in Lorton, VA, aimed at serving the Muslim community and beyond.', '2026-02-28 23:41:39.697855')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (66, 'https://lortonaction.org/food-pantry/', 'Lorton Community Action Center', '9520 Richmond Hwy', 'Lorton', '22079', '(703) 339-5161', 'info@lortonaction.org', ARRAY['22079', '22060'], CAST ( ARRAY['ANY'] AS supported_diet[] ), 'The LCAC food pantry serves individuals and families in Lorton. Registered clients are eligible to attend one of three distributions each week, where they select food and other items for their families. We distribute fruits, vegetables, bread, meat, cereal, a wide range of non-perishable food, and much more. Register Here: https://lortonaction.org/register-for-services/', '2026-02-28 23:41:39.697875')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (67, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Fairfax', '9753 Alwaes Dr', 'Fairfax', '22031', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Parking lot of Yorkville Apartments, facing Kingsbridge. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', '2026-02-28 23:41:39.697894')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (68, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Ellison', 'Ellison St & Irving St', 'Falls Church', '22046', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.', '2026-02-28 23:41:39.697914')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (69, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: Barcroft', 'S Four Mile Run Dr & Columbia Pike', 'Arlington', '22204', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Park & Ride site, corner of Columbia Pike & Four Mile Run Drive/South Buchanan Street, Arlington. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.

', '2026-02-28 23:41:39.697962')
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

INSERT INTO pantries (id, url, name, address, city, zip, phone, email, eligibility, supported_diets, comments, created_at)
VALUES (70, 'https://foodforothers.org/get-help/neighborhood-sites/', 'Food for Others: S. Dickerson ', 'S. Dickerson St & 8th Rd S', 'Arlington', '22204', '(703) 207-9173', 'info@foodforothers.org', ARRAY['ANY'], NULL, 'Must be there at the listed time. Parking lot of high-rise apartment on S. Dickerson St., just off 8th Road, Arlington. If you are in need of food, one of the ways you can receive food is through our neighborhood sites. Neighborhood sites provide supplemental food. You may come to one of the following neighborhood sites at the times specified. The only question that is asked is, “How many people are in your household?” Please bring your own grocery bags.

', '2026-02-28 23:41:39.697987')
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
