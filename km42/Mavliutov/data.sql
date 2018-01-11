


/* Organizer table*/

INSERT INTO Organizer(organizer_login, organizer_email, organizer_password)
VALUES('olexandr11', 'enhof@villagetoys.com', 'qwertyuiio');

INSERT INTO Organizer(organizer_login, organizer_email, organizer_password)
VALUES('olllllon31', 'sales23@villagetoys.com', 'svsdvsdro');

INSERT INTO Organizer(organizer_login, organizer_email, organizer_password)
VALUES('yaroslav', 'yaroslav.mavliutov@gmail.com', 'qqqqqqqq11');

INSERT INTO Organizer(organizer_login, organizer_email, organizer_password)
VALUES('qwertyuio', 'sadfles@villagetoys.com', 'qwertyuii22o');


/* Team table*/

INSERT INTO Team(team_email, team_name)
VALUES('sadf12les@vilys.com', 'DynamoKyiv');

INSERT INTO Team(team_email, team_name)
VALUES('sa12df12les@vilys.com', 'DynamoKyiv1');

INSERT INTO Team(team_email, team_name)
VALUES('sasxadf12les@vilys.com', 'DynamoKyiv2');

INSERT INTO Team(team_email, team_name)
VALUES('saddsvf12les@vilys.com', 'DynamoKyiv3');

INSERT INTO Team(team_email, team_name)
VALUES('sadfses@vilys.com', 'DynamoKyiv4');

INSERT INTO Team(team_email, team_name)
VALUES('sqwes@vilys.com', 'DynamoKyiv5');

INSERT INTO Team(team_email, team_name)
VALUES('3dfes@vilys.com', 'DynamoKyiv6');


/* Tournament table*/

INSERT INTO Tournament(tournament_id, organizer_login_fk, tournament_name, tournament_data_started, tournament_data_end)
VALUES( 1 , 'yaroslav', 'KPIOPEN', TO_DATE('2017-11-20', 'YYYY-MM-DD'),TO_DATE('2017-11-29', 'YYYY-MM-DD'));

INSERT INTO Tournament(tournament_id, organizer_login_fk, tournament_name, tournament_data_started, tournament_data_end)
VALUES( 2 , 'yaroslav', 'KPIOPEN2', TO_DATE('2018-11-20', 'YYYY-MM-DD'), TO_DATE('2018-11-29', 'YYYY-MM-DD') );

INSERT INTO Tournament(tournament_id, organizer_login_fk, tournament_name, tournament_data_started, tournament_data_end)
VALUES( 1 , 'olexandr11', 'football', TO_DATE('2017-11-10', 'YYYY-MM-DD'), TO_DATE('2017-11-29', 'YYYY-MM-DD') );

INSERT INTO Tournament(tournament_id, organizer_login_fk, tournament_name, tournament_data_started, tournament_data_end)
VALUES( 3 , 'yaroslav', 'KPIOPEN3', TO_DATE('2018-12-1', 'YYYY-MM-DD'), TO_DATE('2018-12-23', 'YYYY-MM-DD') );


/* Match table*/

INSERT INTO Match(match_data, team1_email_fk, team2_email_fk, tournament_id_fk, organizer_login_fk)
VALUES(TO_DATE('2017-11-21', 'YYYY-MM-DD'), 'sadf12les@vilys.com', '3dfes@vilys.com', 1, 'yaroslav');

INSERT INTO Match(match_data, team1_email_fk, team2_email_fk, tournament_id_fk, organizer_login_fk)
VALUES(TO_DATE('2017-11-22', 'YYYY-MM-DD'), 'sadf12les@vilys.com', 'sqwes@vilys.com', 1, 'yaroslav');

INSERT INTO Match(match_data, team1_email_fk, team2_email_fk, tournament_id_fk, organizer_login_fk)
VALUES(TO_DATE('2017-11-26', 'YYYY-MM-DD'), 'sqwes@vilys.com', '3dfes@vilys.com', 1, 'yaroslav');

INSERT INTO Match(match_data, team1_email_fk, team2_email_fk, tournament_id_fk, organizer_login_fk)
VALUES(TO_DATE('2017-11-11', 'YYYY-MM-DD'), 'sa12df12les@vilys.com', '3dfes@vilys.com', 1, 'olexandr11');


/* Score table*/

INSERT INTO Score(goal_time, team1_email_fk, team2_email_fk, match_data_fk, team_goal)
VALUES(TO_DATE('2017-11-21 18:25:08', 'YYYY-MM-DD HH24:MI:SS'), 'sadf12les@vilys.com', '3dfes@vilys.com', TO_DATE('2017-11-21', 'YYYY-MM-DD'), '3dfes@vilys.com');

INSERT INTO Score(goal_time, team1_email_fk, team2_email_fk, match_data_fk, team_goal)
VALUES(TO_DATE('2017-11-21 18:40:08', 'YYYY-MM-DD HH24:MI:SS'), 'sadf12les@vilys.com', '3dfes@vilys.com', TO_DATE('2017-11-21', 'YYYY-MM-DD'), '3dfes@vilys.com');

INSERT INTO Score(goal_time, team1_email_fk, team2_email_fk, match_data_fk, team_goal)
VALUES(TO_DATE('2017-11-22 18:25:08', 'YYYY-MM-DD HH24:MI:SS'), 'sadf12les@vilys.com', 'sqwes@vilys.com', TO_DATE('2017-11-22', 'YYYY-MM-DD'), 'sadf12les@vilys.com');

INSERT INTO Score(goal_time, team1_email_fk, team2_email_fk, match_data_fk, team_goal)
VALUES(TO_DATE('2017-11-26 18:25:08', 'YYYY-MM-DD HH24:MI:SS'), 'sqwes@vilys.com', '3dfes@vilys.com', TO_DATE('2017-11-26', 'YYYY-MM-DD'), '3dfes@vilys.com');

INSERT INTO Score(goal_time, team1_email_fk, team2_email_fk, match_data_fk, team_goal)
VALUES(TO_DATE('2017-11-11 18:25:08', 'YYYY-MM-DD HH24:MI:SS'), 'sa12df12les@vilys.com', '3dfes@vilys.com', TO_DATE('2017-11-11', 'YYYY-MM-DD'), '3dfes@vilys.com');


/* Messages table*/

INSERT INTO Messages(message_data, team_email_fk, organizer_login_fk, message_context)
VALUES(TO_DATE('2017-11-12', 'YYYY-MM-DD'), 'sa12df12les@vilys.com', 'olexandr11', 'games');
