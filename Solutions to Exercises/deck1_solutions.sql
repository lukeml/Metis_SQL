--Exercise: Tables and Data Types
-- activities table

create table activities (
    id INTEGER PRIMARY KEY, 
    item VARCHAR(300),
    activity_level INTEGER,
    category VARCHAR(100),
    family_friendly BIT
)

INSERT INTO activities VALUES (1, 'wind surfing', 4, 'sport', 'FALSE');
INSERT INTO activities VALUES (2, 'walk on Great Wall of China', 2, 'site seeing', 'TRUE');
INSERT INTO activities VALUES (3, 'climb Mount Everest', 5, 'sport', 'FALSE');
INSERT INTO activities VALUES (4, 'French cuisine package', 0, 'food and beverage', 'TRUE');
INSERT INTO activities VALUES (5, 'geocaching package', 1, 'sport', 'TRUE');
INSERT INTO activities VALUES (6, 'Broadway musical experience', 0, 'culture', 'TRUE');
INSERT INTO activities VALUES (7, 'helicopter over Grand Canyon', 1, 'site seeing', 'TRUE');
INSERT INTO activities VALUES (8, 'attend Cannes Film Festival', 0, 'culture', 'FALSE');
INSERT INTO activities VALUES (9, 'Napa Valley wine tasting', 0, 'food and beverage', 'FALSE');
INSERT INTO activities VALUES (10, 'Alaskan glacier cruise', 2, 'site seeing', 'TRUE');

--vendors table

create table vendors(
    id INTEGER PRIMARY KEY,
    vendor_name VARCHAR(300),
    phone_number VARCHAR(50),
    city VARCHAR(100),
    activity_id INTEGER,
    price MONEY
)

INSERT INTO vendors VALUES (1, 'Phil`s Surfing Emporium', '800-345-SURF', 'Honolulu', 1, 250);
INSERT INTO vendors VALUES (2, 'Fun, Sun, and Surfing', '888-541-1219', 'San Diego', 1, 300);
INSERT INTO vendors VALUES (3, 'Trekking Everest', '800-212-1001', 'Portland', 3, 14500);
INSERT INTO vendors VALUES (4, 'Le Meilleur de la Mer', '212-905-5521', 'New York', 4, 275);
INSERT INTO vendors VALUES (5, 'Jacques et List', '415-555-1000', 'San Francisco', 4, 199);
INSERT INTO vendors VALUES (6, 'Live Ticket New York', '347-333-SHOW', 'New York', 6, 350);
