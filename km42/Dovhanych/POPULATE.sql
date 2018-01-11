insert into bike(bike_name,  bike_type , wheel_size, bike_color, bike_price, bike_image) values
	('protron', 'sport', '24', white, '200', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike1.jpg')),
	('protron', 'sport', '24', black, '300', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike2.jpg')),
	('audi', 'sport', '24', green, '250', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike3.jpg')),
	('porshe', 'sport', '24', pink, '150', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike4.jpg')),
	('benetto', 'race', '24', yellow, '310', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike5.jpg')),
    ('daimler', 'sport', '24', white, '210', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike6.jpg')),
    ('force', 'mountain', '24', white, '210', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike7.jpg')),
    ('ford', 'race', '28', white, '310', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike8.jpg')),
    ('grizzli', 'sport', '24', white, '150', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike9.jpg')),
    ('benetto', 'race', '28', green, '310', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike10.jpg')),
    ('aviator', 'sport', '24', white, '310', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike11.jpg')),
    ('escobar', 'race', '28', red, '310', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike12.jpg')),
    ('boxer', 'mountain', '24', white, '310', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike13.jpg')),
    ('wesco', 'mountain', '24', white, '310', LOAD_FILE('C:\ENZO\workspace\bikestore\WebContent\bike14.jpg'));
    
    insert into user(first_name, last_name, email, password, role) values 
('Ivan', 'Petrov', 'vanya@yahoo.com', 12345, user),
('Igor', 'Ivanov', 'Igor@yahoo.com', 12345, user),
('Donald', 'Duck', 'donald@gmail.com', 12345, user),
('Alexandr', 'Poznyakov', 'Alexandr@gmail.com', 12345, user),
('Andrew', 'Pochtov', 'Andrew@yahoo.com', 12345, user),
('Mike', 'johnson', 'mike@gmail.com', 12345, user),

('Victor', 'Malinov', 'Victor@gmail.com', 12345, user),
('Logan', 'Wolverine', 'Logan@gmail.com', 12345, user),
('Anthony', 'Stark', 'Iron_man@gmail.com', 12345, user),

('Alex', 'Poroh', 'alex@i.ua', 12345, user),
('Julia', 'Tymoshenko', 'Julia@mail.ru', 12345, user),
('Arseniy', 'Yatsenyuk', 'senya@gmail.com', 12345, user),

('Karen', 'Gillan', 'Karen@mail.ru', 12345, user),
('Elizabeth', 'Debicki', 'Elizabeth@mail.ru', 12345, user),
('Laura', 'Haddock', 'Laura@mail.ru', 12345, user),
('Hannah', 'Gottesman', 'Hannah@mail.ru', 12345, user),
('Megan', 'Fox', 'Megan@mail.ru', 12345, user),
('Rachael', 'Taylor', 'Rachael@mail.ru', 12345, user),
('Amanda', 'Seyfried', 'Amanda@mail.ru', 12345, user),
('Samantha', 'Barks', 'Samantha@mail.ru', 12345, user),
('Keira', 'Knightley', 'Keira@mail.ru', 12345, user),
('Juno', 'Temple', 'Juno@mail.ru', 12345, user),

('Admin', 'Admin', 'admin@gmail.com', 12345, admin)