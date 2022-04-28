--Drop User_Account table

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE USER_ACCOUNT CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/


--Drop Team_Owner Table

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE TEAM_OWNER CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/


--Drop Team Table

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE TEAM CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Drop Venue Table

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE VENUE CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/


--Drop Player Table
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE PLAYER CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Drop Bid Table
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE BID CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Drop League Table
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE LEAGUE CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Drop Fixture Table
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE FIXTURE CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/


--Drop Payment Table
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE PAYMENT CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/


--Drop Ticket_Class Table
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE TICKET_CLASS CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/


--Drop Booking Table
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE BOOKING CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/


--Drop Audience Table
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE AUDIENCE CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/


--Drop Team_Standings Table
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE TEAM_STANDINGS CASCADE CONSTRAINTS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/


--User_Account Table Creation
CREATE TABLE USER_ACCOUNT(
USER_ID NUMBER(10) NOT NULL,
USER_TYPE VARCHAR(10) NOT NULL,
USERNAME VARCHAR(20) NOT NULL,
USER_PWD VARCHAR(20),
AGE NUMBER(2),
SEX VARCHAR(10),
EMAIL VARCHAR(30),
CONTACT NUMBER(10),
CONSTRAINT USER_ACCOUNT_PK PRIMARY KEY(USER_ID));


--Team_Owner Table Creation
CREATE TABLE TEAM_OWNER(
Owner_Id NUMBER(10) NOT NULL,
User_Id NUMBER(10) NOT NULL,
Owner_Name VARCHAR2(30)NOT NULL ,
Team_Name VARCHAR2(30) NOT NULL,
Alloted_Amount NUMBER(30),
CONSTRAINT TEAM_OWNER_PK PRIMARY KEY(Owner_Id));


--Team Table Creation
CREATE TABLE TEAM(
Team_Id VARCHAR2(5) NOT NULL,
Owner_Id NUMBER(10) NOT NULL,
Team_Name VARCHAR2(30) NOT NULL,
Home_Ground VARCHAR2(30),
CONSTRAINT TEAM_PK PRIMARY KEY(Team_Id));

--Venue Table Creation
CREATE TABLE VENUE(
VENUE_ID NUMBER(5) NOT NULL,
VENUE_NAME VARCHAR(30) NOT NULL,
VENUE_STANDS NUMBER(2)NOT NULL,
VENUE_CAPACITY NUMBER(6) NOT NULL,
HOME_TEAM_ID VARCHAR2(5) NOT NULL,
CITY VARCHAR(20),
CONSTRAINT VENUE_PK PRIMARY KEY(VENUE_ID));

--Playe Table Creation
CREATE TABLE PLAYER (
Player_ID NUMBER NOT NULL,
User_ID NUMBER NOT NULL,
Team_ID VARCHAR2(5) NOT NULL,
Player_Name VARCHAR(20) NOT NULL,
Base_Price NUMBER DEFAULT 50000,
Player_Type VARCHAR(20) NOT NULL,
Player_Role VARCHAR(20) NOT NULL,
Country VARCHAR(20) NOT NULL ,
Constraint PLAYER_PK PRIMARY KEY(Player_ID));


--Bid Table Creation
 CREATE TABLE BID(
BID_ID NUMBER(10) NOT NULL,
OWNER_ID NUMBER(10) NOT NULL,
PLAYER_ID NUMBER(10) NOT NULL,
BID_TIME DATE,
IS_FINAL_BID CHAR(1),
BID_AMOUNT NUMBER(10),
LEAGUE_ID NUMBER(10),
CONSTRAINT BID_PK PRIMARY KEY(BID_ID));
 
 
--League Table Creation
CREATE TABLE LEAGUE(
LEAGUE_ID NUMBER(3) NOT NULL,
LEAGUE_NAME VARCHAR(30) NOT NULL,
START_DATE DATE NOT NULL,
END_DATE DATE NOT NULL,
TEAM_COUNT NUMBER(2),
TOTAL_NUMBER_OF_MATCHES NUMBER(3),
CONSTRAINT LEAGUE_PK PRIMARY KEY(LEAGUE_ID));


--Fixture Table Creation
CREATE TABLE FIXTURE(
MATCH_ID NUMBER(5) NOT NULL,
TEAM1_ID VARCHAR2(5) NOT NULL,
TEAM2_ID VARCHAR2(5) NOT NULL,
VENUE_ID NUMBER(5) NOT NULL,
MATCH_DATE DATE NOT NULL,
WINNER VARCHAR2(5) NOT NULL,
WIN_DETAILS VARCHAR(20) NOT NULL,
LEAGUE_ID NUMBER(5) NOT NULL,
CONSTRAINT FIXTURE_PK PRIMARY KEY(MATCH_ID));
 
--Payment Table Creation
CREATE TABLE PAYMENT(
PAYMENT_ID NUMBER(5) NOT NULL,
BID_ID NUMBER(10) NOT NULL,
PLAYER_ID NUMBER NOT NULL,
REFERENCE_NUM NUMBER(10) NOT NULL,
CONSTRAINT PAYMENT_PK PRIMARY KEY(PAYMENT_ID));

--Ticket_Class Table Creation
CREATE TABLE TICKET_CLASS(
TICKET_ID NUMBER(10) NOT NULL,
TICKET_TYPE VARCHAR(10),
TICKET_PRICE NUMBER(5),
CONSTRAINT TICKET_CLASS_PK PRIMARY KEY(TICKET_ID));
 
--Booking Table Creation
CREATE TABLE BOOKING(
BOOKING_ID NUMBER(10) NOT NULL,
MATCH_ID NUMBER(10) NOT NULL,
TICKET_TYPE_ID NUMBER(10) NOT NULL,
AUDIENCE_ID NUMBER(10) NOT NULL,
TICKET_COUNT NUMBER(10),
LEAGUE_ID NUMBER(5),
CONSTRAINT BOOKING_PK PRIMARY KEY(BOOKING_ID));

--Team_Standings Table Creation
CREATE TABLE TEAM_STANDINGS(
TEAM_STANDINGS_ID NUMBER NOT NULL,
TOTAL_MATCHES NUMBER,
MATCHES_WON NUMBER,
MATCHES_LOST NUMBER,
MATCHES_TIED NUMBER,
NO_RESULT NUMBER,
POINTS NUMBER,
LEAGUE_ID NUMBER(5) NOT NULL,
TEAM_ID VARCHAR2(5) NOT NULL,
CONSTRAINT TEAM_STANDINGS_PK PRIMARY KEY(TEAM_STANDINGS_ID));
 
--Audience Table Creation
CREATE TABLE AUDIENCE(
AUDIENCE_ID NUMBER(10) NOT NULL,
USER_ID NUMBER(10) NOT NULL,
AUDIENCE_NAME VARCHAR2(20),
CONSTRAINT AUDIENCE_PK PRIMARY KEY(AUDIENCE_ID));

--Add Foreign Key to Venue Table
ALTER TABLE VENUE
ADD CONSTRAINT fk_homeTeam_id_in_venuetbl
FOREIGN KEY(HOME_TEAM_ID)
REFERENCES TEAM(TEAM_ID) ON DELETE CASCADE;

--Add Foreign Key to Player Table
ALTER TABLE PLAYER
ADD CONSTRAINT fk_user_id_in_playertbl
FOREIGN KEY(USER_ID)
REFERENCES USER_ACCOUNT(USER_ID);


ALTER TABLE PLAYER
ADD CONSTRAINT fk_team_id_in_playertbl
FOREIGN KEY(team_id)
REFERENCES TEAM(team_id) ON DELETE CASCADE;
 
--Add Foreign Key to Bid Table
ALTER TABLE BID
ADD CONSTRAINT fk_owner_id_in_bidtbl
FOREIGN KEY(OWNER_ID)
REFERENCES TEAM_OWNER(OWNER_ID) ON DELETE CASCADE;

 
ALTER TABLE BID
ADD CONSTRAINT fk_player_id_in_bidtbl
FOREIGN KEY(PLAYER_ID)
REFERENCES PLAYER(PLAYER_ID) ON DELETE CASCADE;
 
--Add Foreign Key to Payment Table
ALTER TABLE PAYMENT
ADD CONSTRAINT fk_bid_id_in_paymenttbl
FOREIGN KEY(BID_ID)
REFERENCES BID(BID_ID) ON DELETE CASCADE;
 
 
ALTER TABLE PAYMENT
ADD CONSTRAINT fk_player_id_in_paymenttbl
FOREIGN KEY(PLAYER_ID)
REFERENCES PLAYER(PLAYER_ID);
 
--Add Foreign Key to Team Table
ALTER TABLE TEAM
ADD CONSTRAINT fk_owner_id_in_teamtbl
FOREIGN KEY(OWNER_ID)
REFERENCES TEAM_OWNER(OWNER_ID) ON DELETE CASCADE;
 
--Add Foreign Key to Team_Standings Table
ALTER TABLE TEAM_STANDINGS
ADD CONSTRAINT fk_league_id_in_teamstandingstbl
FOREIGN KEY(LEAGUE_ID)
REFERENCES LEAGUE(LEAGUE_ID);
 
--Add Foreign Key to Fixture Table 
ALTER TABLE FIXTURE
ADD CONSTRAINT fk_team1_id_matchtbl
FOREIGN KEY(TEAM1_ID)
REFERENCES TEAM(TEAM_ID) ON DELETE CASCADE;
 
ALTER TABLE FIXTURE
ADD CONSTRAINT fk_team2_id_matchtbl
FOREIGN KEY(TEAM2_ID)
REFERENCES TEAM(TEAM_ID) ON DELETE CASCADE;
 
 
ALTER TABLE FIXTURE
ADD CONSTRAINT fk_venue_id_matchtbl
FOREIGN KEY(VENUE_ID)
REFERENCES VENUE(VENUE_ID);

--Add Foreign Key to Audience Table
ALTER TABLE AUDIENCE
ADD CONSTRAINT fk_user_id_audiencetbl
FOREIGN KEY(USER_ID)
REFERENCES USER_ACCOUNT(USER_ID);

--Add Foreign Key to Booking Table
ALTER TABLE BOOKING
ADD CONSTRAINT fk_match_id_bookingtbl
FOREIGN KEY(MATCH_ID)
REFERENCES FIXTURE(MATCH_ID) ON DELETE CASCADE;
 
 
ALTER TABLE BOOKING
ADD CONSTRAINT fk_tickettype_id_bookingtbl
FOREIGN KEY(TICKET_TYPE_ID)
REFERENCES TICKET_CLASS(TICKET_ID);
 
ALTER TABLE BOOKING
ADD CONSTRAINT fk_audience_id_bookingtbl
FOREIGN KEY(AUDIENCE_ID)
REFERENCES AUDIENCE(AUDIENCE_ID) ON DELETE CASCADE;
 
--Add Unique Constraints
ALTER TABLE TEAM
ADD CONSTRAINT UNIQUE_TEAM_NAME
UNIQUE (TEAM_NAME);
 
ALTER TABLE VENUE
ADD CONSTRAINT UNIQUE_VENUE_NAME
UNIQUE (VENUE_NAME);
 
ALTER TABLE USER_ACCOUNT
ADD CONSTRAINT UNIQUE_USER_NAME
UNIQUE (USERNAME);
 
 
ALTER TABLE LEAGUE
ADD CONSTRAINT LEAGUE_NAME
UNIQUE (LEAGUE_NAME);
 
 
ALTER TABLE TEAM_OWNER
ADD CONSTRAINT OWNER_NAME
UNIQUE (OWNER_NAME);
 
 
ALTER TABLE PAYMENT
ADD CONSTRAINT REFERENCE_NUM
UNIQUE (REFERENCE_NUM);
 
ALTER TABLE PLAYER
ADD CONSTRAINT PLAYER_NAME
UNIQUE (PLAYER_NAME);
 
--Add Foreign Key to Fixture Table
ALTER TABLE FIXTURE
ADD CONSTRAINT fk_league_id_matchtbl
FOREIGN KEY(league_id)
REFERENCES LEAGUE(league_id);
 
--Add Foreign Key to Bid Table  
ALTER TABLE BID
ADD CONSTRAINT fk_league_id_fixturetbl
FOREIGN KEY(league_id)
REFERENCES LEAGUE(league_id);

--Add Check constraint to Booking Table
ALTER TABLE booking
ADD CONSTRAINT check_no_of_tickets
CHECK (ticket_count < 20);

--Alter data type of League_Id in league Table
ALTER TABLE LEAGUE
MODIFY LEAGUE_ID NUMBER(5);


DROP SEQUENCE BOOKING_SEQ;

DROP SEQUENCE TICKET_CLASS_SEQ;

DROP SEQUENCE TEAM_STANDINGS_SEQ;

DROP SEQUENCE REFERENCE_NUMBER_SEQ;


CREATE SEQUENCE BOOKING_SEQ START WITH 5000 INCREMENT BY 1;

CREATE SEQUENCE TICKET_CLASS_SEQ START WITH 2000 INCREMENT BY 1;

CREATE SEQUENCE TEAM_STANDINGS_SEQ START WITH 3000 INCREMENT BY 1;

CREATE SEQUENCE REFERENCE_NUMBER_SEQ START WITH 20000 INCREMENT BY 1;

--Truncate Table User_Account before insertion

BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE USER_ACCOUNT' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table Team_Owner before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEAM_OWNER' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table Team before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEAM' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table Venue before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE VENUE' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table Player before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE PLAYER' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table Bid before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE BID' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table League before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE LEAGUE' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table Fixture before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE FIXTURE' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table Payment before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE PAYMENT' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table Ticket_Class before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TICKET_CLASS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table Booking before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE BOOKING' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

--Truncate Table Audience before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE AUDIENCE' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/


--Truncate Table Team_Standings before insertion
BEGIN
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEAM_STANDINGS' ;
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

-- insert owner type users into the user_account

    INSERT INTO admin.user_account VALUES (   1, 'OWNER', 'VijayMallya', 'Royals@123', 55, 'MALE', 'royalchallengers18@gmail.com', 6175467398);
    INSERT INTO admin.user_account VALUES (   2, 'OWNER', 'Srinivasan', 'Kings@456', 43, 'MALE', 'superkings7@gmail.com', 8765234768);
    INSERT INTO admin.user_account VALUES (   3, 'OWNER', 'ShahrukhKhan', 'Riders@789', 48, 'MALE', 'knightriders99@gmail.com', 7156242356);
    INSERT INTO admin.user_account VALUES (   4, 'OWNER', 'Ambani', 'Indians@1947', 56, 'MALE', 'mightyindians25@gmail.com', 6467853549);
    INSERT INTO admin.user_account VALUES (   5, 'OWNER', 'Kalanithi', 'Risers@007', 36, 'MALE', 'sunrisers1997@gmail.com', 8175846574);
    INSERT INTO admin.user_account VALUES (   6, 'OWNER', 'ParthJindal', 'Devils@333', 41, 'MALE', 'daredevils333@gmail.com', 8135657832);
    INSERT INTO admin.user_account VALUES (   7, 'OWNER', 'ManojBadale', 'Rajasthan@77', 51, 'MALE', 'royalhurricanes55@gmail.com', 8733245876);
    INSERT INTO admin.user_account VALUES (   8, 'OWNER', 'PreityZinta', 'Punjab@67', 33, 'FEMALE', 'supergiants111@gmail.com', 8793452187);
    INSERT INTO admin.user_account VALUES (   9, 'OWNER', 'BCCIOWNER', 'BCCIowner@1967', 40, 'MALE', 'bcciindia@gmail.com', 8579997683);

-- insert Audience type users into the user_account

    INSERT INTO admin.user_account VALUES (  10 , 'AUDIENCE', 'Rakesh', 'Rakesh@1996', 25, 'MALE', 'rakeshkumar313@gmail.com', 9914567532);
    INSERT INTO admin.user_account VALUES (   11, 'AUDIENCE', 'Mahesh', 'Mahesh@1997', 29, 'MALE', 'maheshkumar39@gmail.com', 9835378965);
    INSERT INTO admin.user_account VALUES (   12, 'AUDIENCE', 'Suresh', 'Suresh@1973', 45, 'MALE', 'sureshkapuganti127@gmail.com', 8763454289);
    INSERT INTO admin.user_account VALUES (   13, 'AUDIENCE', 'Mohan', 'Mohan@1997', 29, 'MALE', 'mohankumar39@gmail.com', 9835378989);
    INSERT INTO admin.user_account VALUES (   14, 'AUDIENCE', 'Rajesh', 'Rajesh@4564', 21, 'MALE', 'rajeshkanna76@gmail.com', 7652986634);
    INSERT INTO admin.user_account VALUES (   15, 'AUDIENCE', 'Swathi', 'swathi@0007', 25, 'FEMALE', 'swathikrishna88@gmail.com', 8762934612);
    INSERT INTO admin.user_account VALUES (   16, 'AUDIENCE', 'Monal', 'Monal@1993', 29, 'FEMALE', 'monalgajjar66@gmail.com', 9823488213);
    INSERT INTO admin.user_account VALUES (   17, 'AUDIENCE', 'Akhil', 'Akhilsarthak@25', 26, 'MALE', 'akhilsarthak25@gmail.com', 6135874897);
    INSERT INTO admin.user_account VALUES (   18, 'AUDIENCE', 'Abhijeet', 'Abhijeet@197', 37, 'MALE', 'abhijeetdudkela22@gmail.com', 7634293366);
    INSERT INTO admin.user_account VALUES (   19, 'AUDIENCE', 'Avinash', 'Avinash@1996', 27, 'MALE', 'ravinashkumar33@gmail.com', 9833156739);
    INSERT INTO admin.user_account VALUES (   20, 'AUDIENCE', 'Sandhya', 'Sandhya@143', 23, 'FEMALE', 'Sandhya93@gmail.com', 9812564987);
    INSERT INTO admin.user_account VALUES (   21, 'AUDIENCE', 'Amrutha', 'Amrutha@13', 28, 'FEMALE', 'Amrutha4567@gmail.com', 8734569832);
    INSERT INTO admin.user_account VALUES (   22, 'AUDIENCE', 'Saketh', 'Saketh@16', 23, 'MALE', 'sakethkosuri16@gmail.com', 9827456378);
    INSERT INTO admin.user_account VALUES (   23, 'AUDIENCE', 'Eswar', 'Eswarsainath@15', 29, 'MALE', 'eswarsainath3@gmail.com', 9834277890);
    INSERT INTO admin.user_account VALUES (   24, 'AUDIENCE', 'Santhosh', 'Santhosh@75', 33, 'MALE', 'santhoshkrishna35@gmail.com', 6136578936);
    INSERT INTO admin.user_account VALUES (   25, 'AUDIENCE', 'Divya', 'Divyanarayan@19', 21, 'FEMALE', 'divyanarayana9@gmail.com', 7756798302);
    INSERT INTO admin.user_account VALUES (   26, 'AUDIENCE', 'Preethi', 'Preethi@1995', 31, 'FEMALE', 'preethikurbani333@gmail.com', 8732565093);
    INSERT INTO admin.user_account VALUES (   27, 'AUDIENCE', 'Sandeep', 'Sandeep@33', 33, 'MALE', 'sandeepkumar36@gmail.com', 9732657997);
    INSERT INTO admin.user_account VALUES (   28, 'AUDIENCE', 'Mohith', 'Mohith@1997', 26, 'MALE', 'mohithkumar1123@gmail.com', 9126533987);
    INSERT INTO admin.user_account VALUES (   29, 'AUDIENCE', 'Varun', 'Varun@1133', 39, 'MALE', 'varunrao1133@gmail.com', 8796243357);
    INSERT INTO admin.user_account VALUES (   30, 'AUDIENCE', 'Ramesh', 'Ramesh@1996', 25, 'MALE', 'rameshkumar313@gmail.com', 9914567123);
    INSERT INTO admin.user_account VALUES (   31, 'AUDIENCE', 'Anjali', 'Anjali@1997', 26, 'FEMALE', 'anjali@gmail.com', 9914567321);
    INSERT INTO admin.user_account VALUES (   32, 'AUDIENCE', 'Gayatri', 'Gayatri@1995', 23, 'FEMALE', 'gayatri@gmail.com', 9914765123);
    INSERT INTO admin.user_account VALUES (   33, 'AUDIENCE', 'Vara', 'Vara@1994', 21, 'FEMALE', 'vara@gmail.com', 8814765123);
    INSERT INTO admin.user_account VALUES (   34, 'AUDIENCE', 'Lova', 'Lova@1982', 47, 'FEMALE', 'lova@gmail.com', 8874165123);
    INSERT INTO admin.user_account VALUES (   35, 'AUDIENCE', 'Ramudu', 'Ramudu@1984', 51, 'MALE', 'ramudu@gmail.com', 8418765123);
    INSERT INTO admin.user_account VALUES (   36, 'AUDIENCE', 'Krishna', 'Krishna@1991', 21, 'MALE', 'krishna@gmail.com', 8814715623);
    INSERT INTO admin.user_account VALUES (   37, 'AUDIENCE', 'Harsha', 'Harsha@2004', 12, 'MALE', 'harsha@gmail.com', 7714765123);
    INSERT INTO admin.user_account VALUES (   38, 'AUDIENCE', 'Abhi', 'Abhi@2005', 21, 'MALE', 'abhi@gmail.com', 8814789123);
    INSERT INTO admin.user_account VALUES (   39, 'AUDIENCE', 'Nani', 'Nani@2007', 19, 'MALE', 'nani@gmail.com', 7414765123);
    
    -- insert Player type users into the user_account

    INSERT INTO admin.user_account VALUES(   40,'PLAYER','DHONI','DHONI@123',38,'MALE','dhoni777@gmail.com',6134896531);
    INSERT INTO admin.user_account VALUES(   41,'PLAYER','Kohli','Kohli@123',32,'MALE','kohli777@gmail.com',6134896532);
    INSERT INTO admin.user_account VALUES(   42,'PLAYER','yuvraj','yuvraj@123',38,'MALE','yuvraj777@gmail.com',6134896533);
    INSERT INTO admin.user_account VALUES(   43,'PLAYER','rohit','rohit@123',33,'MALE','rohit777@gmail.com',6134896534);
    INSERT INTO admin.user_account VALUES(   44,'PLAYER','gambhir','gambhir@123',36,'MALE','gambhir777@gmail.com',6134896535);
    INSERT INTO admin.user_account VALUES(   45,'PLAYER','sachin','sachin@123',41,'MALE','sachin777@gmail.com',6134896536);
    INSERT INTO admin.user_account VALUES(   46,'PLAYER','ganguly','ganguly@123',36,'MALE','ganguly777@gmail.com',6134896537);
    INSERT INTO admin.user_account VALUES(   47,'PLAYER','sehwag','sehwag@123',39,'MALE','sehwag777@gmail.com',6134896538);
    INSERT INTO admin.user_account VALUES(   48,'PLAYER','laxman','laxman@123',38,'MALE','laxman777@gmail.com',6134896539);
    INSERT INTO admin.user_account VALUES(   49,'PLAYER','zaheer','zaheer@123',38,'MALE','zaheer777@gmail.com',6134896540);
    INSERT INTO admin.user_account VALUES(   50,'PLAYER','srinath','srinath@123',34,'MALE','srinath777@gmail.com',6134896541);
    INSERT INTO admin.user_account VALUES(   51,'PLAYER','ambatirayudu','ambatirayudu@123',36,'MALE','ambatirayudu777@gmail.com',6134896546);
    INSERT INTO admin.user_account VALUES(   52,'PLAYER','dwaynebravo','dwaynebravo@123',41,'MALE','dwaynebravo777@gmail.com',6134896547);
    INSERT INTO admin.user_account VALUES(   53,'PLAYER','robinuthappa','robinuthappa@123',36,'MALE','robinuthappa777@gmail.com',6134896548);
    INSERT INTO admin.user_account VALUES(   54,'PLAYER','deepakchahar','deepakchahar@123',39,'MALE','deepakchahar777@gmail.com',6134896549);
    INSERT INTO admin.user_account VALUES(   55,'PLAYER','kmasif','kmasif@123',38,'MALE','kmasif777@gmail.com',6134896550);
    INSERT INTO admin.user_account VALUES(   56,'PLAYER','tushardeshpande','tushardeshpande@123',38,'MALE','tushardeshpande777@gmail.com',6134896551);
    INSERT INTO admin.user_account VALUES(   57,'PLAYER','shivamdube','shivamdube@123',34,'MALE','shivamdube777@gmail.com',6134896552);
    INSERT INTO admin.user_account VALUES(   58,'PLAYER','maheshtheekshana','maheshtheekshana@123',28,'MALE','maheshtheekshana777@gmail.com',6134896553);
    INSERT INTO admin.user_account VALUES(   59,'PLAYER','rhangargekar','rhangargekar@123',32,'MALE','rhangargekar777@gmail.com',6134896554);
    INSERT INTO admin.user_account VALUES(   60,'PLAYER','simarjeetsingh','simarjeetsingh@123',38,'MALE','simarjeetsingh777@gmail.com',6134896555);
    INSERT INTO admin.user_account VALUES(   61,'PLAYER','devonconway','devonconway@123',33,'MALE','devonconway777@gmail.com',6134896556);
    INSERT INTO admin.user_account VALUES(  62,'PLAYER','charinishanth','charinishanth@123',38,'MALE','charinishanth777@gmail.com',6134896562);
    INSERT INTO admin.user_account VALUES(  63,'PLAYER','njagadeesan','njagadeesan@123',34,'MALE','njagadeesan777@gmail.com',6134896563);
    INSERT INTO admin.user_account VALUES(  64,'PLAYER','chrisjordan','chrisjordan@123',28,'MALE','chrisjordan777@gmail.com',6134896564);
    INSERT INTO admin.user_account VALUES(  65,'PLAYER','fafduplessis','fafduplessis@123',32,'MALE','fafduplessis777@gmail.com',6134896565);
    INSERT INTO admin.user_account VALUES(  66,'PLAYER','glennmaxwell','glennmaxwell@123',38,'MALE','glennmaxwell@gmail.com',6134896566);
    INSERT INTO admin.user_account VALUES(  67,'PLAYER','anujrawat','anujrawat@123',33,'MALE','anujrawat777@gmail.com',6134896567);
    INSERT INTO admin.user_account VALUES(  68,'PLAYER','dineshkarthik','dineshkarthik@123',36,'MALE','dineshkarthik777@gmail.com',6134896568);
    INSERT INTO admin.user_account VALUES(  69,'PLAYER','kanewilliamson','kanewilliamson@123',41,'MALE', 'kanewilliamson777@gmail.com',6134896569);
    INSERT INTO admin.user_account VALUES(  70,'PLAYER','sanjusamson', 'sanjusamson @123',36,'MALE', 'sanjusamson777@gmail.com',6134896570);
    INSERT INTO admin.user_account VALUES(  71,'PLAYER','hardikpandya','hardikpandya@123',39,'MALE','hardikpandya777@gmail.com',6134896571);
    INSERT INTO admin.user_account VALUES(  72,'PLAYER','shreyasiyer','shreyasiyer@123',38,'MALE','shreyasiyer777@gmail.com',6134896572);
     INSERT INTO admin.user_account VALUES(    73,'PLAYER','waninduhasaranga','waninduhasaranga@123',41,'MALE','waninduhasaranga777@gmail.com',6134896577);
    INSERT INTO admin.user_account VALUES(    74,'PLAYER','joshhazlewood','joshhazlewood@123',36,'MALE','joshhazlewood777@gmail.com',6134896578);
    INSERT INTO admin.user_account VALUES(    75,'PLAYER','harshalpatel','harshalpatel@123',39,'MALE','harshalpatel777@gmail.com',6134896579);
    INSERT INTO admin.user_account VALUES(    76,'PLAYER','davidwilley','davidwilley@123',38,'MALE','davidwilley777@gmail.com',6134896581);
    INSERT INTO admin.user_account VALUES(    77,'PLAYER','akashdeep','akashdeep@123',34,'MALE','akashdeep777@gmail.com',6134896582);
    INSERT INTO admin.user_account VALUES(    78,'PLAYER','shahbazahmed','shahbazahmed@123',28,'MALE','shahbazahmed777@gmail.com',6134896583);
    INSERT INTO admin.user_account VALUES(    79,'PLAYER','finnallen','finnallen@123',32,'MALE','finnallen777@gmail.com',6134896584);
    INSERT INTO admin.user_account VALUES(    80,'PLAYER','shefanerutherford','shefane@123',38,'MALE','shefanerutherford777@gmail.com',6134896580);
    INSERT INTO admin.user_account VALUES(    81,'PLAYER','subhranshusenapati','subhranshu@123',39,'MALE','subhranshu777@gmail.com',6134896560);
    INSERT INTO admin.user_account VALUES(    82,'PLAYER','TimSouthee', 'TimSouthee@123',36,'MALE', 'TimSouthee@gmail.com',6134891038);
    INSERT INTO admin.user_account VALUES(    83,'PLAYER','karthik','karthik@123',36,'MALE','karthik777@gmail.com',6134896753);
    INSERT INTO admin.user_account VALUES(    84,'PLAYER','TilakVarma','TilakVarma@123',36,'MALE','TilakVarma777@gmail.com',6134891004);
    INSERT INTO admin.user_account VALUES(    85,'PLAYER','SuryaYadav','SuryaYadav@123',41,'MALE','SuryaYadav777@gmail.com',6134891005);
    INSERT INTO admin.user_account VALUES(    86,'PLAYER','ArjunTendulkar','ArjunTendulkar@123',36,'MALE','ArjunTendulkar777@gmail.com',6134891006);
    INSERT INTO admin.user_account VALUES(    87,'PLAYER','DanielSams','DanielSams@123',39,'MALE','DanielSams777@gmail.com',6134891007);
    INSERT INTO admin.user_account VALUES(    88,'PLAYER','Bumrah','Bumrah@123',38,'MALE','Bumrah777@gmail.com',6134891008);
    INSERT INTO admin.user_account VALUES(    89,'PLAYER','BasilThampi','BasilThampi@123',38,'MALE','BasilThampi@gmail.com',6134891009);
    INSERT INTO admin.user_account VALUES(    90,'PLAYER','TymalMills','TymalMills@123',34,'MALE','TymalMills@gmail.com',6134891010);
    INSERT INTO admin.user_account VALUES(    91,'PLAYER','Pollard','Pollard@123',28,'MALE','Pollard@gmail.com',6134891011);
    INSERT INTO admin.user_account VALUES(    92,'PLAYER','Ramandeep','Ramandeep@123',32,'MALE','Ramandeep@gmail.com',6134891012);
    INSERT INTO admin.user_account VALUES(    93,'PLAYER','FabianAllen','FabianAllen@123',38,'MALE','FabianAllen@gmail.com',6134891013);
    INSERT INTO admin.user_account VALUES(    94,'PLAYER','Rileymeredith','Rileymeredith@123',33,'MALE','Rileymeredith@gmail.com',6134891014);
     INSERT INTO admin.user_account VALUES(    95,'PLAYER','ArshadKhan','ArshadKhan@123',38,'MALE','ArshadKhan@gmail.com',6134891019);
    INSERT INTO admin.user_account VALUES(    96,'PLAYER','Anmolpreet','Anmolpreet@123',38,'MALE','Anmolpreet@gmail.com',6134891020);
    INSERT INTO admin.user_account VALUES(    97,'PLAYER','MayankMarkande','MayankMarkande@123',34,'MALE','MayankMarkande@gmail.com',6134891021);
    INSERT INTO admin.user_account VALUES(    98,'PLAYER','AryanJuyal','AryanJuyal@123',28,'MALE','AryanJuyal@gmail.com',6134891022);
    INSERT INTO admin.user_account VALUES(    99,'PLAYER','RahulBuddhi','RahulBuddhi@123',32,'MALE','RahulBuddhi@gmail.com',6134891023);
    INSERT INTO admin.user_account VALUES(    100,'PLAYER','PatCummins','PatCummins@123',38,'MALE','PatCummins@gmail.com',6134891024);
    INSERT INTO admin.user_account VALUES(    101,'PLAYER','AndreRussell','AndreRussell@123',33,'MALE','AndreRussell@gmail.com',6134891025);
    INSERT INTO admin.user_account VALUES(    102,'PLAYER','VenkateshIyer','VenkateshIyer@123',36,'MALE','VenkateshIyer@gmail.com',6134891026);
    INSERT INTO admin.user_account VALUES(    103,'PLAYER','SheldonJackson','SheldonJackson@123',41,'MALE','SheldonJackson@gmail.com',6134891027);
    INSERT INTO admin.user_account VALUES(    104,'PLAYER','AjinkyaRahane','AjinkyaRahane@123',36,'MALE','AjinkyaRahane@gmail.com',6134891028);
    INSERT INTO admin.user_account VALUES(    105,'PLAYER','Finch','Finch@123',38,'MALE','Finch@gmail.com',6134891029);
    INSERT INTO admin.user_account VALUES(    106,'PLAYER','SunilNarine','SunilNarine@123',38,'MALE','SunilNarine@gmail.com',6134891034);
    INSERT INTO admin.user_account VALUES(    107,'PLAYER','KarunaRatneChamika','KarunaRatne@123',33,'MALE','KarunaRatneChamika@gmail.com',6134891035);
    INSERT INTO admin.user_account VALUES(    108,'PLAYER','VarunChakraborty','VarunChakraborty@123',36,'MALE','VarunChakraborty@gmail.com',6134891036);
    INSERT INTO admin.user_account VALUES(    109,'PLAYER','NitishRana','NitishRana@123',41,'MALE', 'NitishRana@gmail.com',6134891037);
    INSERT INTO admin.user_account VALUES(    110,'PLAYER','RameshKumar','RameshKumar@123',39,'MALE','RameshKumar@gmail.com',6134891039);
    INSERT INTO admin.user_account VALUES(    111,'PLAYER','BabaIndrajith','BabaIndrajith@123',38,'MALE','BabaIndrajith@gmail.com',6134891040);
    INSERT INTO admin.user_account VALUES(    112,'PLAYER','AnukulRoy','AnukulRoy@123',38,'MALE','AnukulRoy@gmail.com',6134891041);
    INSERT INTO admin.user_account VALUES(    113,'PLAYER','ShivamMavi','ShivamMavi@123',34,'MALE','ShivamMavi@gmail.com',6134891042);
    INSERT INTO admin.user_account VALUES(    114,'PLAYER','MohammadNabi','MohammadNabi@123',28,'MALE','MohammadNabi@gmail.com',6134891043);
    INSERT INTO admin.user_account VALUES(    115,'PLAYER','RinkuSingh','RinkuSingh@123',32,'MALE','RinkuSingh@gmail.com',6134891044);
    INSERT INTO admin.user_account VALUES(    116,'PLAYER','PrathamSingh','PrathamSingh@123',41,'MALE','PrathamSingh@gmail.com',6134891045);
    INSERT INTO admin.user_account VALUES(    117,'PLAYER','RowmanPowell','RowmanPowell@123',28,'MALE','RowmanPowell@gmail.com',6134891050);
    INSERT INTO admin.user_account VALUES(    118,'PLAYER','PrithviShaw','PrithviShaw@123',32,'MALE','PrithviShaw@gmail.com',6134891051);
    INSERT INTO admin.user_account VALUES(    119,'PLAYER','MustafizRahman','MustafizRahman@123',38,'MALE','MustafizRahman@gmail.com',6134891052);
    INSERT INTO admin.user_account VALUES(    120,'PLAYER','SarfrazKhan','SarfrazKhan@123',39,'MALE','SarfrazKhan@gmail.com',6134891053);
    INSERT INTO admin.user_account VALUES(    121,'PLAYER','ShardulThakur','ShardulThakur@123',36,'MALE','ShardulThakur@gmail.com',6134891054);
    INSERT INTO admin.user_account VALUES(    122,'PLAYER','Chahal','Chahal@123',38,'MALE','Chahal@gmail.com',6134892000);
    INSERT INTO admin.user_account VALUES(    123,'PLAYER','Devdutt','Devdutt@123',34,'MALE','Devdutt@gmail.com',6134892001);
    INSERT INTO admin.user_account VALUES(    124,'PLAYER','Buttler','Buttler@123',28,'MALE','Buttler@gmail.com',6134892002);
    INSERT INTO admin.user_account VALUES(    125,'PLAYER','Ashwin','Ashwin@123',32,'MALE','Ashwin@gmail.com',6134892003);
    INSERT INTO admin.user_account VALUES(    126,'PLAYER','CoulterNile','CoulterNile@123',41,'MALE','CoulterNile@gmail.com',6134892004);
    INSERT INTO admin.user_account VALUES(    127,'PLAYER','RussieVanderDussen','RussieVander@123',36,'MALE','RussieVanderDussen@gmail.com',6134892005);
    
    INSERT INTO admin.user_account VALUES(   128,'PLAYER','praveen','praveen@123',28,'MALE','praveen777@gmail.com',6134896542);
    INSERT INTO admin.user_account VALUES(   129,'PLAYER','ravijadeja','ravijadeja@123',32,'MALE','ravijadeja777@gmail.com',6134896543);
    INSERT INTO admin.user_account VALUES(   130,'PLAYER','MoeenAli','MoeenAli@123',38,'MALE','MoeenAli777@gmail.com',6134896544);
    INSERT INTO admin.user_account VALUES(   131,'PLAYER','rutugaikwad','rutugaikwad@123',33,'MALE','rutugaikwad777@gmail.com',6134896545);
    INSERT INTO admin.user_account VALUES(    132,'PLAYER','rishabhpant','rishabhpant@123',38,'MALE','rishabhpant@gmail.com',6134896573);
    INSERT INTO admin.user_account VALUES(    133,'PLAYER','rohitsharma','rohitsharma@123',34,'MALE','rohitsharma777@gmail.com',6134896574);
    INSERT INTO admin.user_account VALUES(    134,'PLAYER','klrahul','klrahul@123',28,'MALE','klrahul777@gmail.com',6134896575);
    INSERT INTO admin.user_account VALUES(    135,'PLAYER','mayankaggarwal','mayankaggarwal@123',32,'MALE','mayankaggarwal777@gmail.com',6134896576);
    INSERT INTO admin.user_account VALUES(    136,'PLAYER','MuruganAshwin','MuruganAshwin@123',36,'MALE','MuruganAshwin@gmail.com',6134891015);
    INSERT INTO admin.user_account VALUES(    137,'PLAYER','Unadkat','Unadkat@123',41,'MALE','Unadkat@gmail.com',6134891016);
    INSERT INTO admin.user_account VALUES(    138,'PLAYER','SanjayYadav','SanjayYadav@123',36,'MALE','SanjayYadav@gmail.com',6134891017);
    INSERT INTO admin.user_account VALUES(    139,'PLAYER','HrithikShokeen','HrithikShokeen@123',39,'MALE','HrithikShokeen@gmail.com',6134891018);
    INSERT INTO admin.user_account VALUES(    140,'PLAYER','AbhijeetTomar','AbhijeetTomar@123',36,'MALE','AbhijeetTomar@gmail.com',6134891046);
    INSERT INTO admin.user_account VALUES(    141,'PLAYER','AshokSharma','AshokSharma@123',39,'MALE','AshokSharma@gmail.com',6134891047);
    INSERT INTO admin.user_account VALUES(    142,'PLAYER','DavidWarner','DavidWarner@123',38,'MALE','DavidWarner@gmail.com',6134891048);
    INSERT INTO admin.user_account VALUES(    143,'PLAYER','AnrichNortje','AnrichNortje@123',34,'MALE','AnrichNortje@gmail.com',6134891049);
    
  --- extra players Under BCCI
  
    INSERT INTO admin.user_account VALUES(   144,'PLAYER','dwainepretorius','dwainepretorius@123',36,'MALE','dwainepretorius777@gmail.com',6134896557);
    INSERT INTO admin.user_account VALUES(   145,'PLAYER','mitchsantner','mitchsantner@123',41,'MALE','mitchsantner777@gmail.com',6134896558);
    INSERT INTO admin.user_account VALUES(   146,'PLAYER','adammilne','adammilne@123',36,'MALE','adammilne777@gmail.com',6134896559);
    INSERT INTO admin.user_account VALUES(   147,'PLAYER','prashantsolanki','prashantsolanki@123',38,'MALE','prashantsolanki777@gmail.com',6134896561);
    INSERT INTO admin.user_account VALUES(    148,'PLAYER','DewaldBrevis','DewaldBrevis@123',38,'MALE','DewaldBrevis777@gmail.com',6134891000);
    INSERT INTO admin.user_account VALUES(    149,'PLAYER','JofraArcher','JofraArcher@123',32,'MALE','JofraArcher777@gmail.com',6134891001);
    INSERT INTO admin.user_account VALUES(    150,'PLAYER','TimDavid','TimDavid@123',38,'MALE','TimDavid777@gmail.com',6134891002);
    INSERT INTO admin.user_account VALUES(    151,'PLAYER','IshanKishan','IshanKishan@123',33,'MALE','IshanKishan777@gmail.com',6134891003);
    INSERT INTO admin.user_account VALUES(    152,'PLAYER','Billings','Billings@123',38,'MALE','Billings@gmail.com',6134891030);
    INSERT INTO admin.user_account VALUES(    153,'PLAYER','Rasikh','Rasikh@123',34,'MALE','Rasikh@gmail.com',6134891031);
    INSERT INTO admin.user_account VALUES(    154,'PLAYER','AlexHales','AlexHales@123',28,'MALE','AlexHales@gmail.com',6134891032);
    INSERT INTO admin.user_account VALUES(    155,'PLAYER','UmeshYadav','UmeshYadav@123',32,'MALE','UmeshYadav@gmail.com',6134891033);
    INSERT INTO admin.user_account VALUES(    156,'PLAYER','KuldeepSen','KuldeepSen@123',39,'MALE','KuldeepSen@gmail.com',6134892006);
    INSERT INTO admin.user_account VALUES(    157,'PLAYER','TrentBoult','TrentBoult@123',38,'MALE','TrentBoult@gmail.com',6134892007);
    INSERT INTO admin.user_account VALUES(    158,'PLAYER','RiyanParag','RiyanParag@123',34,'MALE','RiyanParag@gmail.com',6134892008);
    INSERT INTO admin.user_account VALUES(    159,'PLAYER','SHimronHetmyer','SHimronHetmyer@123',28,'MALE','SHimronHetmyer@gmail.com',6134892009);
    
    -- insert Extra players
    
    INSERT INTO admin.user_account VALUES(    160,'PLAYER','KuldipYadav','KuldipYadav@123',32,'MALE','KuldipYadav@gmail.com',6134892010);
    INSERT INTO admin.user_account VALUES(    161,'PLAYER','DarylMitchell','DarylMitchell@123',38,'MALE','DarylMitchell@gmail.com',6134892011);
    INSERT INTO admin.user_account VALUES(    162,'PLAYER','Neesham','Neesham@123',39,'MALE','Neesham@gmail.com',6134892012);
    INSERT INTO admin.user_account VALUES(    163,'PLAYER','JaiswalYash','JaiswalYash@123',36,'MALE','JaiswalYash@gmail.com',6134892013);
    INSERT INTO admin.user_account VALUES(    164,'PLAYER','KarunNair', 'KarunNair@123',36,'MALE', 'KarunNair@gmail.com',6134892014);
    
   COMMIT;
  

-- insert owner values into team_owner table.
    
INSERT INTO admin.team_owner VALUES (  200, 2, 'Srinivasan',   'ChennaiSuperKings',  50000000);
INSERT INTO admin.team_owner VALUES (  201, 4, 'Ambani',   'MumbaiIndians',  50000000);
INSERT INTO admin.team_owner VALUES (  202, 5, 'Kalanithi',   'SunrisersHyderabad',  50000000);
INSERT INTO admin.team_owner VALUES (  203, 3, 'SharukhKhan',   'KolkataKnightRiders',  50000000);
INSERT INTO admin.team_owner VALUES (  204, 7, 'Manoj',   'RajasthanRoyals',  50000000);
INSERT INTO admin.team_owner VALUES (  205, 8, 'Preity',   'KingsXIPunjab',  50000000);
INSERT INTO admin.team_owner VALUES (  206, 1, 'Vijay',   'RoyalChallengersBangalore',  50000000);
INSERT INTO admin.team_owner VALUES (  207, 6, 'Parth',   'DelhiCapitals',  50000000); 
INSERT INTO admin.team_owner VALUES (  208, 9, 'BCCI',   'TeamBCCI',  0);  
COMMIT;


-- insert team values into team table.

INSERT INTO admin.Team VALUES ('MI', 201, 'MumbaiIndians',  'Wankhede' );
INSERT INTO admin.Team VALUES ('RCB', 206, 'RoyalChallengersBangalore',  'Chinnaswamy' );
INSERT INTO admin.Team VALUES ('SRH', 202, 'SunrisersHyderabad',  'Rajiv Gandhi' );
INSERT INTO admin.Team VALUES ('KKR',203, 'KolkataKnightRiders',  'Eden Gardens' );
INSERT INTO admin.Team VALUES ('RR',204, 'RajasthanRoyals',  'Sawai Mansingh' );
INSERT INTO admin.Team VALUES ('KXIP',205, 'KingsXIPunjab',  'PCA Stadium' );
INSERT INTO admin.Team VALUES ('CSK',200, 'ChennaiSuperKings',  'M. A. Chidambaram' );
INSERT INTO admin.Team VALUES ('DC',207, 'DelhiCapitals',  'Arun Jaitley' );
INSERT INTO admin.Team VALUES('BCCI', 208, 'TeamBCCI', 'Chairman of BCCI');
COMMIT;


-- insert player values into player table.

--DELHI CAPITALS
INSERT INTO ADMIN.player VALUES(311, 51, 'DC', 'AMBATIRAYUDU', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(312, 52, 'DC', 'DWAYNEBRAVO', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(313, 53, 'DC', 'ROBINUTHAPPA', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(314, 54, 'DC', 'DEEPAKCHAHAR', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(315, 55, 'DC', 'KMASIF', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(316, 56, 'DC', 'TUSHARDESHPANDE', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(317, 57, 'DC', 'SHIVAMDUBE', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(318, 58, 'DC', 'MAHESHTHEEKSHANA', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(319, 59, 'DC', 'RHANGARGEKAR', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(320, 60, 'DC', 'SIMARJEETSINGH', DEFAULT, 'INTERNATIONAL','ALLROUNDER','AUSTRALIA');
INSERT INTO ADMIN.player VALUES(321, 61, 'DC', 'DEVONCONWAY', DEFAULT, 'INTERNATIONAL','BATSMAN','ENGLAND');




--RCB
INSERT INTO ADMIN.player VALUES(333, 73, 'RCB', 'WANINDUHASARANGA', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(334, 74, 'RCB', 'JOSHHAZLEWOOD', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(335, 75, 'RCB', 'HARSHALPATEL', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(336, 76, 'RCB', 'DAVIDWILLEY', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(337, 77, 'RCB', 'AKASHDEEP', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(338, 78, 'RCB', 'SHAHBAZAHMED', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(339, 79, 'RCB', 'FINNALLEN', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(340, 80, 'RCB', 'SHEFANERUTHERFORD', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(341, 81, 'RCB', 'SUBHRANSHUSENAPATI', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(342, 82, 'RCB', 'TIMSOUTHEE', DEFAULT, 'INTERNATIONAL','ALLROUNDER','AUSTRALIA');
INSERT INTO ADMIN.player VALUES(343, 83, 'RCB', 'KARTHIK', DEFAULT, 'INTERNATIONAL','BATSMAN','ENGLAND');


--KKR
INSERT INTO ADMIN.player VALUES(355, 95, 'KKR', 'ARSHADKHAN', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(356, 96, 'KKR', 'ANMOLPREET', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(357, 97, 'KKR', 'MAYANKMARKHANDE', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(358, 98, 'KKR', 'ARYANJUYAL', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(359, 99, 'KKR', 'RAHULBUDDHI', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(360, 100, 'KKR', 'PATCUMMINS', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(361, 101, 'KKR', 'ANDRERUSSELL', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(362, 102, 'KKR', 'VENKATESHIYER', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(363, 103, 'KKR', 'SHELDONJACKSON', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(364, 104, 'KKR', 'AJINKYARAHANE', DEFAULT, 'INTERNATIONAL','ALLROUNDER','AUSTRALIA');
INSERT INTO ADMIN.player VALUES(365, 105, 'KKR', 'FINCH', DEFAULT, 'INTERNATIONAL','BATSMAN','ENGLAND');



--KXIP
INSERT INTO ADMIN.player VALUES(377, 117, 'KXIP', 'ROMANPOWELL', DEFAULT, 'INTERNATIONAL','WK','WESTINDIES');
INSERT INTO ADMIN.player VALUES(378, 118, 'KXIP', 'PRITHVISHAW', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(379, 119, 'KXIP', 'MUSTAFIZURRAHMAN', DEFAULT, 'INTERNATIONAL','BATSMAN','AFGANISTHAN');
INSERT INTO ADMIN.player VALUES(380, 120, 'KXIP', 'SARFARAZKHAN', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(381, 121, 'KXIP', 'SHARDULTHAKUR', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(382, 122, 'KXIP', 'CHAHAL', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(383, 123, 'KXIP', 'DEVDUTTPADIKKAL', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(384, 124, 'KXIP', 'JOSBUTTLER', DEFAULT, 'INTERNATIONAL','BATSMAN','ENGLAND');
INSERT INTO ADMIN.player VALUES(385, 125, 'KXIP', 'ASHWIN', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(386, 126, 'KXIP', 'COUTERNILE', DEFAULT, 'INTERNATIONAL','ALLROUNDER','AUSTRALIA');
INSERT INTO ADMIN.player VALUES(387, 127, 'KXIP', 'VANDERDUSSEN', DEFAULT, 'INTERNATIONAL','BATSMAN','ENGLAND');



--'BCCI'
INSERT INTO ADMIN.player VALUES(404, 144, 'BCCI', 'DWAINEPRETORIUS', DEFAULT, 'INTERNATIONAL','ALLROUNDER','NEWZEALAND');
INSERT INTO ADMIN.player VALUES(405, 145, 'BCCI', 'MITCHSANTNER', DEFAULT, 'INTERNATIONAL','BOWLER','SRILANKA');
INSERT INTO ADMIN.player VALUES(406, 146, 'BCCI', 'ADAMMILNE', DEFAULT, 'INTERNATIONAL','BOWLER','AFGHANISTHAN');
INSERT INTO ADMIN.player VALUES(407, 147, 'BCCI', 'PRASHANTSOLANKI', DEFAULT, 'INTERNATIONAL','BOWLER','WESTINDIES');
INSERT INTO ADMIN.player VALUES(408, 148, 'BCCI', 'DEWALDBREVIS', DEFAULT, 'INTERNATIONAL','ALLROUNDER','NEWZEALAND');
INSERT INTO ADMIN.player VALUES(409, 149, 'BCCI', 'JOFRAARCHER', DEFAULT, 'INTERNATIONAL','BOWLER','SRILANKA');
INSERT INTO ADMIN.player VALUES(410, 150, 'BCCI', 'TIMDAVID', DEFAULT, 'INTERNATIONAL','BOWLER','AFGHANISTHAN');
INSERT INTO ADMIN.player VALUES(411, 151, 'BCCI', 'ISHANKISHAN', DEFAULT, 'INTERNATIONAL','BOWLER','WESTINDIES');
INSERT INTO ADMIN.player VALUES(412, 152, 'BCCI', 'BILLINGS', DEFAULT, 'INTERNATIONAL','ALLROUNDER','NEWZEALAND');
INSERT INTO ADMIN.player VALUES(413, 153, 'BCCI', 'RASIKH', DEFAULT, 'INTERNATIONAL','BOWLER','SRILANKA');
INSERT INTO ADMIN.player VALUES(414, 154, 'BCCI', 'ALEXHALES', DEFAULT, 'INTERNATIONAL','BOWLER','AFGHANISTHAN');
INSERT INTO ADMIN.player VALUES(415, 155, 'BCCI', 'UMESHYADAV', DEFAULT, 'INTERNATIONAL','BOWLER','WESTINDIES');
INSERT INTO ADMIN.player VALUES(416, 156, 'BCCI', 'KULDEEPSEN', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(417, 157, 'BCCI', 'TRENTBOULT', DEFAULT, 'INTERNATIONAL','BOWLER','SRILANKA');
INSERT INTO ADMIN.player VALUES(418, 158, 'BCCI', 'RIYANPARAG', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(419, 159, 'BCCI', 'SHIMRONHETMEYER', DEFAULT, 'INTERNATIONAL','BOWLER','WESTINDIES');
INSERT INTO ADMIN.player VALUES(388, 128, 'BCCI', 'PRAVEEN', DEFAULT, 'INTERNATIONAL','ALLROUNDER','NEWZEALAND');
INSERT INTO ADMIN.player VALUES(389, 129, 'BCCI', 'RAVIJADEJA', DEFAULT, 'INTERNATIONAL','BOWLER','SRILANKA');
INSERT INTO ADMIN.player VALUES(390, 130, 'BCCI', 'MOEENALI', DEFAULT, 'INTERNATIONAL','BOWLER','AFGHANISTHAN');
INSERT INTO ADMIN.player VALUES(391, 131, 'BCCI', 'RUTUGAIKWAD', DEFAULT, 'INTERNATIONAL','BOWLER','WESTINDIES');
INSERT INTO ADMIN.player VALUES(392, 132, 'BCCI', 'RISHABPANT', DEFAULT, 'INTERNATIONAL','ALLROUNDER','NEWZEALAND');
INSERT INTO ADMIN.player VALUES(393, 133, 'BCCI', 'ROHITSHARMA', DEFAULT, 'INTERNATIONAL','BOWLER','SRILANKA');
INSERT INTO ADMIN.player VALUES(394, 134, 'BCCI', 'KLRAHUL', DEFAULT, 'INTERNATIONAL','BOWLER','AFGHANISTHAN');
INSERT INTO ADMIN.player VALUES(395, 135, 'BCCI', 'MAYANKAGGARWAL', DEFAULT, 'INTERNATIONAL','BOWLER','WESTINDIES');
INSERT INTO ADMIN.player VALUES(396, 136, 'BCCI', 'MURUGANASHWIN', DEFAULT, 'INTERNATIONAL','ALLROUNDER','NEWZEALAND');
INSERT INTO ADMIN.player VALUES(397, 137, 'BCCI', 'UNADKAT', DEFAULT, 'INTERNATIONAL','BOWLER','SRILANKA');
INSERT INTO ADMIN.player VALUES(398, 138, 'BCCI', 'SANJAYYADAV', DEFAULT, 'INTERNATIONAL','BOWLER','AFGHANISTHAN');
INSERT INTO ADMIN.player VALUES(399, 139, 'BCCI', 'HRITHIKSHOKEEN', DEFAULT, 'INTERNATIONAL','BOWLER','WESTINDIES');
INSERT INTO ADMIN.player VALUES(400, 140, 'BCCI', 'ABHIJEETTOMAR', DEFAULT, 'INTERNATIONAL','ALLROUNDER','NEWZEALAND');
INSERT INTO ADMIN.player VALUES(401, 141, 'BCCI', 'ASHOKSHARMA', DEFAULT, 'INTERNATIONAL','BOWLER','SRILANKA');
INSERT INTO ADMIN.player VALUES(402, 142, 'BCCI', 'DAVIDWARNER', DEFAULT, 'INTERNATIONAL','BOWLER','AFGHANISTHAN');
INSERT INTO ADMIN.player VALUES(403, 143, 'BCCI', 'ANRICHNORTJE', DEFAULT, 'INTERNATIONAL','BOWLER','WESTINDIES');


--csk
INSERT INTO ADMIN.player VALUES(300, 40, 'CSK', 'DHONI', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(301, 41, 'CSK', 'KOHLI', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(302, 42, 'CSK', 'YUVRAJ', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(303, 43, 'CSK', 'ROHIT', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(304, 44, 'CSK', 'GAMBHIR', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(305, 45, 'CSK', 'SACHIN', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(306, 46, 'CSK', 'GANGULY', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(307, 47, 'CSK', 'SEHWAG', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(308, 48, 'CSK', 'LAXMAN', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(309, 49, 'CSK', 'ZAHEER', DEFAULT, 'INTERNATIONAL','ALLROUNDER','AUSTRALIA');
INSERT INTO ADMIN.player VALUES(310, 50, 'CSK', 'SRINATH', DEFAULT, 'INTERNATIONAL','BATSMAN','ENGLAND');

--MI
INSERT INTO ADMIN.player VALUES(322, 62, 'MI', 'CHARINISHANTH', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(323, 63, 'MI', 'NJAGADEESAN', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(324, 64, 'MI', 'CHRISJORDAN', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(325, 65, 'MI', 'FAFDUPLESSIS', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(326, 66, 'MI', 'GLENNMAXWELL', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(327, 67, 'MI', 'ANUJRAWAT', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(328, 68, 'MI', 'DINESHKARTHIK', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(329, 69, 'MI', 'KANEWILLIAMSON', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(330, 70, 'MI', 'SANJUSAMSON', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(331, 71, 'MI', 'HARDIKPANDYA', DEFAULT, 'INTERNATIONAL','ALLROUNDER','AUSTRALIA');
INSERT INTO ADMIN.player VALUES(332, 72, 'MI', 'SHREYASIYER', DEFAULT, 'INTERNATIONAL','BATSMAN','ENGLAND');


--srh
INSERT INTO ADMIN.player VALUES(344, 84, 'SRH', 'TILAKVARMA', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(345, 85, 'SRH', 'SURYAYADAV', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(346, 86, 'SRH', 'ARJUNTENDULKAR', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(347, 87, 'SRH', 'DANIELSAMS', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(348, 88, 'SRH', 'BUMRAH', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(349, 89, 'SRH', 'BASILTHAMPI', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(350, 90, 'SRH', 'TYMALMILLS', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(351, 91, 'SRH', 'POLLARD', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(352, 92, 'SRH', 'RAMANDEEP', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(353, 93, 'SRH', 'FABIANALLEN', DEFAULT, 'INTERNATIONAL','ALLROUNDER','AUSTRALIA');
INSERT INTO ADMIN.player VALUES(354, 94, 'SRH', 'RILEYMEREDITH', DEFAULT, 'INTERNATIONAL','BATSMAN','ENGLAND');


--RR
INSERT INTO ADMIN.player VALUES(366, 106, 'RR', 'SUNILNARINE', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(367, 107, 'RR', 'KARUNARATNECHAMIKA', DEFAULT, 'DOMESTIC','WK','INDIA');
INSERT INTO ADMIN.player VALUES(368, 108, 'RR', 'VARUNCHAKRABORTY', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(369, 109, 'RR', 'NITISHRANA', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(370, 110, 'RR', 'RAMESHKUMAR', DEFAULT, 'DOMESTIC','BATSMAN','INDIA');
INSERT INTO ADMIN.player VALUES(371, 111, 'RR', 'BABAINDRAJITH', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(372, 112, 'RR', 'ANKULROY', DEFAULT, 'DOMESTIC','ALLROUNDER','INDIA');
INSERT INTO ADMIN.player VALUES(373, 113, 'RR', 'SHIVAMMAVI', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(374, 114, 'RR', 'MOHAMMADNABI', DEFAULT, 'DOMESTIC','BOWLER','INDIA');
INSERT INTO ADMIN.player VALUES(375, 115, 'RR', 'RINKUSINGH', DEFAULT, 'INTERNATIONAL','ALLROUNDER','AUSTRALIA');
INSERT INTO ADMIN.player VALUES(376, 116, 'RR', 'PRATHAMSINGH', DEFAULT, 'INTERNATIONAL','BATSMAN','ENGLAND');

commit;


-- insert audience into audience_table

INSERT INTO ADMIN.audience VALUES (  500 , 51, 'Varun');
INSERT INTO ADMIN.audience VALUES (   501, 50, 'Mohith');
INSERT INTO ADMIN.audience VALUES (   502, 49, 'Sandeep');
INSERT INTO ADMIN.audience VALUES (   503, 48, 'Preethi');
INSERT INTO ADMIN.audience VALUES (   504, 47, 'Divya');
INSERT INTO ADMIN.audience VALUES (   505, 46, 'Santhosh');
INSERT INTO ADMIN.audience VALUES (   506, 45, 'Eswar');
INSERT INTO ADMIN.audience VALUES (   507, 44, 'Saketh');
INSERT INTO ADMIN.audience VALUES (   508, 43, 'Amrutha');
INSERT INTO ADMIN.audience VALUES (   509, 42, 'Sandhya');
INSERT INTO ADMIN.audience VALUES (   510, 19, 'Avinash');
INSERT INTO ADMIN.audience VALUES (   511, 18, 'Abhijeet');
INSERT INTO ADMIN.audience VALUES (   512, 17, 'Akhil');
INSERT INTO ADMIN.audience VALUES (   513, 16, 'Monal');
INSERT INTO ADMIN.audience VALUES (   514, 15, 'Swathi');
INSERT INTO ADMIN.audience VALUES (   515, 14, 'Rajesh');
INSERT INTO ADMIN.audience VALUES (   516, 13, 'Mohan');
INSERT INTO ADMIN.audience VALUES (   517, 12, 'Suresh');
INSERT INTO ADMIN.audience VALUES (   518, 11, 'Mahesh');
INSERT INTO ADMIN.audience VALUES (   519, 10, 'Rakesh');
INSERT INTO admin.AUDIENCE VALUES(   520, 32, 'Ramesh Kumar');
INSERT INTO admin.AUDIENCE VALUES(   521, 33, 'Anjali Rajesh');
INSERT INTO admin.AUDIENCE VALUES(   522, 34, 'Gayatri Krishna');
INSERT INTO admin.AUDIENCE VALUES(   523, 35, 'Vara Prasad');
INSERT INTO admin.AUDIENCE VALUES(   524, 36, 'Lova Ramesh');
INSERT INTO admin.AUDIENCE VALUES(   525, 37, 'Ramudu Kumar');
INSERT INTO admin.AUDIENCE VALUES(   526, 38, 'Krishna Chaitanya');
INSERT INTO admin.AUDIENCE VALUES(   527, 39, 'Harsha Kiran');
INSERT INTO admin.AUDIENCE VALUES(   528, 40, 'Abhishek Sharma');
INSERT INTO admin.AUDIENCE VALUES(   529, 41, 'Nani Naveen');
commit;



--Insert League values into League Table
INSERT INTO admin.LEAGUE VALUES (1000, 'Pepsi IPL 2015', TO_DATE('2015-04-08 20:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2015-05-24 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 8, 28);
INSERT INTO admin.LEAGUE VALUES (1001, 'Pepsi IPL 2016', TO_DATE('2016-04-09 20:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2016-05-29 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 8, 28);
INSERT INTO admin.LEAGUE VALUES (1002, 'UnAcademy IPL 2017', TO_DATE('2017-04-05 20:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2017-05-21 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 8, 28);
INSERT INTO admin.LEAGUE VALUES (1003, 'UnAcademy IPL 2018', TO_DATE('2018-04-07 20:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2018-05-27 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 8, 28);
INSERT INTO admin.LEAGUE VALUES (1004, 'UnAcademy IPL 2019', TO_DATE('2019-04-08 20:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2019-05-24 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 8, 28);
INSERT INTO admin.LEAGUE VALUES (1005, 'Vivo IPL 2020', TO_DATE('2020-04-08 20:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2020-05-24 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 8, 28);
INSERT INTO admin.LEAGUE VALUES (1006, 'Vivo IPL 2021', TO_DATE('2021-04-08 20:00:00', 'yyyy-MM-dd hh24:mi:ss'), TO_DATE('2021-05-24 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 8, 28);

COMMIT;



--Insert Bid values into Bid Table

---KKR Bidding
INSERT INTO admin.BID VALUES(701, 200, 355, TO_DATE('2021-02-16 02:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(702, 203, 355, TO_DATE('2021-02-16 02:05:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11000000, 1006);
INSERT INTO admin.BID VALUES(703, 201, 356, TO_DATE('2021-02-16 02:10:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12000000, 1006);
INSERT INTO admin.BID VALUES(704, 201, 357, TO_DATE('2021-02-16 02:15:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(705, 203, 357, TO_DATE('2021-02-16 02:20:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12500000, 1006);
INSERT INTO admin.BID VALUES(706, 203, 358, TO_DATE('2021-02-16 02:25:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);
INSERT INTO admin.BID VALUES(707, 205, 359, TO_DATE('2021-02-16 02:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(708, 203, 359, TO_DATE('2021-02-16 02:35:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 10500000, 1006);
INSERT INTO admin.BID VALUES(709, 203, 360, TO_DATE('2021-02-16 02:40:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11000000, 1006);
INSERT INTO admin.BID VALUES(710, 202, 361, TO_DATE('2021-02-16 02:45:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 11500000, 1006);
INSERT INTO admin.BID VALUES(711, 203, 361, TO_DATE('2021-02-16 02:50:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12300000, 1006);
INSERT INTO admin.BID VALUES(712, 203, 362, TO_DATE('2021-02-16 02:55:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13500000, 1006);
INSERT INTO admin.BID VALUES(713, 201, 363, TO_DATE('2021-02-16 03:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 14000000, 1006);
INSERT INTO admin.BID VALUES(714, 203, 363, TO_DATE('2021-02-16 03:05:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 14500000, 1006);
INSERT INTO admin.BID VALUES(715, 203, 364, TO_DATE('2021-02-16 03:10:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);
INSERT INTO admin.BID VALUES(716, 203, 365, TO_DATE('2021-02-16 03:13:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);

--RR
INSERT INTO admin.BID VALUES(717, 203, 366, TO_DATE('2021-02-16 03:15:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(718, 204, 366, TO_DATE('2021-02-16 03:20:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11000000, 1006);
INSERT INTO admin.BID VALUES(719, 204, 367, TO_DATE('2021-02-16 03:25:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12000000, 1006);
INSERT INTO admin.BID VALUES(720, 202, 368, TO_DATE('2021-02-16 03:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(721, 204, 368, TO_DATE('2021-02-16 03:35:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12500000, 1006);
INSERT INTO admin.BID VALUES(722, 204, 369, TO_DATE('2021-02-16 03:40:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);
INSERT INTO admin.BID VALUES(723, 205, 370, TO_DATE('2021-02-16 03:45:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(724, 204, 370, TO_DATE('2021-02-16 03:50:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 10500000, 1006);
INSERT INTO admin.BID VALUES(725, 204, 371, TO_DATE('2021-02-16 03:55:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11000000, 1006);
INSERT INTO admin.BID VALUES(726, 205, 372, TO_DATE('2021-02-16 04:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 11500000, 1006);
INSERT INTO admin.BID VALUES(727, 204, 372, TO_DATE('2021-02-16 04:05:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12300000, 1006);
INSERT INTO admin.BID VALUES(728, 204, 373, TO_DATE('2021-02-16 04:10:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13500000, 1006);
INSERT INTO admin.BID VALUES(729, 207, 374, TO_DATE('2021-02-16 04:15:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 14000000, 1006);
INSERT INTO admin.BID VALUES(730, 204, 374, TO_DATE('2021-02-16 04:20:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 14500000, 1006);
INSERT INTO admin.BID VALUES(731, 204, 375, TO_DATE('2021-02-16 04:25:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);
INSERT INTO admin.BID VALUES(732, 204, 376, TO_DATE('2021-02-16 04:28:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);

--KXIP 

INSERT INTO admin.BID VALUES(733, 204, 377, TO_DATE('2021-02-16 04:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(734, 205, 377, TO_DATE('2021-02-16 04:35:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11000000, 1006);
INSERT INTO admin.BID VALUES(735, 205, 378, TO_DATE('2021-02-16 04:40:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12000000, 1006);
INSERT INTO admin.BID VALUES(736, 203, 379, TO_DATE('2021-02-16 04:45:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(737, 205, 379, TO_DATE('2021-02-16 04:50:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12500000, 1006);
INSERT INTO admin.BID VALUES(738, 205, 380, TO_DATE('2021-02-16 04:55:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);
INSERT INTO admin.BID VALUES(739, 206, 381, TO_DATE('2021-02-16 05:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(740, 205, 381, TO_DATE('2021-02-16 05:05:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 10500000, 1006);
INSERT INTO admin.BID VALUES(741, 205, 382, TO_DATE('2021-02-16 05:10:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11000000, 1006);
INSERT INTO admin.BID VALUES(742, 202, 383, TO_DATE('2021-02-16 05:15:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 11500000, 1006);
INSERT INTO admin.BID VALUES(743, 205, 383, TO_DATE('2021-02-16 05:20:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12300000, 1006);
INSERT INTO admin.BID VALUES(744, 205, 384, TO_DATE('2021-02-16 05:25:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13500000, 1006);
INSERT INTO admin.BID VALUES(745, 201, 385, TO_DATE('2021-02-16 05:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 14000000, 1006);
INSERT INTO admin.BID VALUES(746, 205, 385, TO_DATE('2021-02-16 05:35:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 14500000, 1006);
INSERT INTO admin.BID VALUES(747, 205, 386, TO_DATE('2021-02-16 05:40:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);
INSERT INTO admin.BID VALUES(748, 205, 387, TO_DATE('2021-02-16 05:42:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);


---DC

INSERT INTO admin.BID VALUES(749, 202, 311, TO_DATE('2021-02-16 05:45:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(750, 207, 311, TO_DATE('2021-02-16 05:50:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11000000, 1006);
INSERT INTO admin.BID VALUES(751, 207, 312, TO_DATE('2021-02-16 05:55:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12000000, 1006);
INSERT INTO admin.BID VALUES(752, 202, 313, TO_DATE('2021-02-16 06:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(753, 207, 313, TO_DATE('2021-02-16 06:05:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12500000, 1006);
INSERT INTO admin.BID VALUES(754, 207, 314, TO_DATE('2021-02-16 06:10:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);
INSERT INTO admin.BID VALUES(755, 202, 315, TO_DATE('2021-02-16 06:15:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000000, 1006);
INSERT INTO admin.BID VALUES(756, 207, 315, TO_DATE('2021-02-16 06:20:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 10500000, 1006);
INSERT INTO admin.BID VALUES(757, 207, 316, TO_DATE('2021-02-16 06:25:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11000000, 1006);
INSERT INTO admin.BID VALUES(758, 201, 317, TO_DATE('2021-02-16 06:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 11500000, 1006);
INSERT INTO admin.BID VALUES(759, 207, 317, TO_DATE('2021-02-16 06:35:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12300000, 1006);
INSERT INTO admin.BID VALUES(760, 207, 318, TO_DATE('2021-02-16 06:40:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13500000, 1006);
INSERT INTO admin.BID VALUES(761, 200, 319, TO_DATE('2021-02-16 06:45:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 14000000, 1006);
INSERT INTO admin.BID VALUES(762, 207, 319, TO_DATE('2021-02-16 06:50:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 14500000, 1006);
INSERT INTO admin.BID VALUES(763, 207, 320, TO_DATE('2021-02-16 06:55:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);
INSERT INTO admin.BID VALUES(764, 207, 321, TO_DATE('2021-02-16 06:58:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15000000, 1006);


--CSK
INSERT INTO admin.BID VALUES(600, 202, 300, TO_DATE('2021-02-15 10:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000083,1006);
INSERT INTO admin.BID VALUES(601, 200, 300, TO_DATE('2021-02-15 10:01:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12000000,1006);
INSERT INTO admin.BID VALUES(602, 200, 301, TO_DATE('2021-02-15 10:01:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 10300000,1006);
INSERT INTO admin.BID VALUES(603, 208, 301, TO_DATE('2021-02-15 10:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000090,1006);
INSERT INTO admin.BID VALUES(604, 200, 302, TO_DATE('2021-02-15 10:31:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 14000000,1006);
INSERT INTO admin.BID VALUES(605, 200, 303, TO_DATE('2021-02-15 10:32:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13200000,1006);
INSERT INTO admin.BID VALUES(606, 200, 304, TO_DATE('2021-02-15 10:40:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 15600000,1006);
INSERT INTO admin.BID VALUES(607, 203, 305, TO_DATE('2021-02-15 10:45:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10073000,1006);
INSERT INTO admin.BID VALUES(608, 200, 305, TO_DATE('2021-02-15 10:50:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 135000000,1006);
INSERT INTO admin.BID VALUES(609, 200, 306, TO_DATE('2021-02-15 11:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12935000,1006);
INSERT INTO admin.BID VALUES(610, 200, 307, TO_DATE('2021-02-15 11:33:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12300000,1006);
INSERT INTO admin.BID VALUES(611, 200, 308, TO_DATE('2021-02-15 12:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 32000000,1006);
INSERT INTO admin.BID VALUES(612, 200, 309, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12000000,1006);
INSERT INTO admin.BID VALUES(613, 200, 310, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12000000,1006);

--MI

INSERT INTO admin.BID VALUES(614, 202,322, TO_DATE('2021-02-15 12:04:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000083,1006);
INSERT INTO admin.BID VALUES(615, 201, 322, TO_DATE('2021-02-15 12:06:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13400000,1006);
INSERT INTO admin.BID VALUES(616, 201, 323 ,TO_DATE('2021-02-15 12:01:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12300000,1006);
INSERT INTO admin.BID VALUES(617,  201,324, TO_DATE('2021-02-15 12:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11300090,1006);
INSERT INTO admin.BID VALUES(618,  205, 325, TO_DATE('2021-02-15 12:31:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 11200000,1006);
INSERT INTO admin.BID VALUES(619,  201,325, TO_DATE('2021-02-15 1:32:00', 'yyyy-MM-dd hh24:mi:ss'),  'T', 14200000,1006);
INSERT INTO admin.BID VALUES(620,  206, 326,  TO_DATE('2021-02-15 10:40:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 12600000,1006);
INSERT INTO admin.BID VALUES(621,  201,326,  TO_DATE('2021-02-15 10:45:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13373000,1006);
INSERT INTO admin.BID VALUES(622,  201, 327, TO_DATE('2021-02-15 10:50:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 136000000,1006);
INSERT INTO admin.BID VALUES(623,  201, 328, TO_DATE('2021-02-15 11:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13935000,1006);
INSERT INTO admin.BID VALUES(624,  204, 329, TO_DATE('2021-02-15 11:33:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 12300000,1006);
INSERT INTO admin.BID VALUES(625,  201, 329, TO_DATE('2021-02-15 12:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 32000000,1006);
INSERT INTO admin.BID VALUES(626,  201, 330, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12230000,1006);
INSERT INTO admin.BID VALUES(627,  201, 331, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11800000,1006);
INSERT INTO admin.BID VALUES(628,  201, 332, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11800000,1006);



--RCB
INSERT INTO admin.BID VALUES(629, 201, 333, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 10000083,1006);
INSERT INTO admin.BID VALUES(630, 206, 333, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13400000,1006);
INSERT INTO admin.BID VALUES(631, 206, 334, TO_DATE('2021-02-15 12:05:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12300000,1006);
INSERT INTO admin.BID VALUES(632, 206, 335, TO_DATE('2021-02-15 12:13:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11350090,1006);
INSERT INTO admin.BID VALUES(633, 207, 336, TO_DATE('2021-02-15 12:38:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 14200000,1006);
INSERT INTO admin.BID VALUES(634, 206, 336, TO_DATE('2021-02-15 1:32:00', 'yyyy-MM-dd hh24:mi:ss'),  'T', 15400000,1006);
INSERT INTO admin.BID VALUES(635, 201, 337, TO_DATE('2021-02-15 10:20:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 12600000,1006);
INSERT INTO admin.BID VALUES(636, 206, 337, TO_DATE('2021-02-15 10:34:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13373000,1006);
INSERT INTO admin.BID VALUES(637, 206, 338, TO_DATE('2021-02-15 10:50:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 136000000,1006);
INSERT INTO admin.BID VALUES(638, 206, 339, TO_DATE('2021-02-15 11:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13935000,1006);
INSERT INTO admin.BID VALUES(639, 203, 340, TO_DATE('2021-02-15 11:33:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12300000,1006);
INSERT INTO admin.BID VALUES(640, 206, 341, TO_DATE('2021-02-15 12:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 32000000,1006);
INSERT INTO admin.BID VALUES(641, 206, 342, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12230000,1006);
INSERT INTO admin.BID VALUES(642, 206, 343, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11800000,1006);


---SRH
INSERT INTO admin.BID VALUES(657, 202, 344, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 10000083,1006);
INSERT INTO admin.BID VALUES(643, 201, 345, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 13400000,1006);
INSERT INTO admin.BID VALUES(644, 202, 345, TO_DATE('2021-02-15 12:05:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13700000,1006);
INSERT INTO admin.BID VALUES(645, 202, 346, TO_DATE('2021-02-15 12:13:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11350090,1006);
INSERT INTO admin.BID VALUES(646, 205, 347, TO_DATE('2021-02-15 12:38:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 14200000,1006);
INSERT INTO admin.BID VALUES(647, 202, 347, TO_DATE('2021-02-15 1:32:00', 'yyyy-MM-dd hh24:mi:ss'),  'T', 15400000,1006);
INSERT INTO admin.BID VALUES(648, 203, 348, TO_DATE('2021-02-15 10:20:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 12600000,1006);
INSERT INTO admin.BID VALUES(649, 202, 348, TO_DATE('2021-02-15 10:34:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13373000,1006);
INSERT INTO admin.BID VALUES(650, 205, 349, TO_DATE('2021-02-15 10:50:00', 'yyyy-MM-dd hh24:mi:ss'), 'F', 136000000,1006);
INSERT INTO admin.BID VALUES(651, 202, 349, TO_DATE('2021-02-15 11:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 13935000,1006);
INSERT INTO admin.BID VALUES(652, 202, 350, TO_DATE('2021-02-15 11:33:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12300000,1006);
INSERT INTO admin.BID VALUES(653, 202, 351, TO_DATE('2021-02-15 12:00:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 32000000,1006);
INSERT INTO admin.BID VALUES(654, 202, 352, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12230000,1006);
INSERT INTO admin.BID VALUES(655, 202, 353, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 11800000,1006);
INSERT INTO admin.BID VALUES(656, 202, 354, TO_DATE('2021-02-15 12:03:00', 'yyyy-MM-dd hh24:mi:ss'), 'T', 12230000,1006);

COMMIT;


--Insert Payment values into Payment Table
INSERT INTO admin.Payment VALUES(800,601,300,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(801,602,301,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(802,604,302,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(803,605,303,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(804,606,304,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(805,608,305,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(806,609,306,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(807,610,307,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(808,611,308,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(809,612,309,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(810,613,310,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(811,615,322,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(812,616,323,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(813,617,324,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(814,619,325,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(815,621,326,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(816,622,327,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(817,623,328,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(818,625,329,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(819,626,330,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(820,627,331,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(821,628,332,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(822,630,333,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(823,631,334,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(824,632,335,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(825,634,336,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(826,636,337,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(827,637,338,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(828,638,339,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(829,640,341,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(830,641,342,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(831,642,343,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(832,657,344,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(833,644,345,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(834,645,346,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(835,647,347,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(836,649,348,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(837,651,349,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(838,652,350,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(839,653,351,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(840,654,352,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(841,655,353,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(842,656,354,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(843,702,355,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(844,703,356,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(845,705,357,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(846,706,358,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(847,708,359,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(848, 709,360  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(849, 711, 361 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(850, 712, 362 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(851, 714, 363  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(852, 715, 364  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(853, 716, 365 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(854, 718,366  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(855, 719, 367 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(856, 721,  368,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(857, 722, 369 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(858, 724, 370 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(859, 725,  371,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(860, 727, 372 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(861, 728,373  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(862, 730, 374 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(863, 731, 375 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(864, 732 , 376 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(865, 734, 377 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(866, 735, 378  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(867, 737 , 379 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(868, 738 , 380 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(869, 740, 381  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(870, 741, 382  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(871, 743, 383  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(872, 744, 384  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(873, 746, 385  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(874, 747, 386 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(875, 748, 387 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(876, 750, 311 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(877, 751, 312  ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(878, 753, 313 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(879, 754, 314 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(880, 756, 315 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(881, 757, 316 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(882, 759, 317 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(883, 760, 318 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(884, 762, 319 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(885, 763,  320,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(886, 764, 321 ,admin.reference_number_seq.NEXTVAL);
INSERT INTO admin.Payment VALUES(887,639,340,admin.reference_number_seq.NEXTVAL);

COMMIT;


--Insert Venue values into Venue Table

INSERT INTO admin.VENUE VALUES (1100, 'Eden Gardens', 8, 85000, 'KKR' , 'Kolkota');
INSERT INTO admin.VENUE VALUES (1101, 'MA Chidambaram Stadium', 5, 75000, 'CSK' , 'Chennai');
INSERT INTO admin.VENUE VALUES (1102, 'Arun Jaitley Stadium', 8, 95000, 'DC' , 'Delhi');
INSERT INTO admin.VENUE VALUES (1103, 'Wankhede Stadium', 8, 95000, 'MI' , 'Mumbai');
INSERT INTO admin.VENUE VALUES (1104, 'M.Chinnaswamy Stadium', 8, 95000, 'RCB' , 'Bengaluru');
INSERT INTO admin.VENUE VALUES (1105, 'Narendra Modi Stadium', 8, 90000, 'KXIP' , 'Punjab');
INSERT INTO admin.VENUE VALUES (1106, 'Rajiv Gandhi Stadium', 8, 95000, 'SRH' , 'Hyderabad');
INSERT INTO admin.VENUE VALUES (1107, 'Sawai Mansingh Stadium', 8, 95000, 'RR' , 'Jaipur');

COMMIT;






--Insert Fixture values into Fixture Table
INSERT INTO admin.FIXTURE VALUES(900, 'CSK', 'RCB', 1101, TO_DATE('2021-05-24 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'CSK', 'WON BY 10 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(901, 'CSK', 'MI', 1103, TO_DATE('2021-05-25 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'MI', 'WON BY 8 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(902, 'CSK', 'KKR', 1101, TO_DATE('2021-05-26 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'CSK', 'WON BY 9 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(903, 'CSK', 'DC', 1102, TO_DATE('2021-05-27 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'DC', 'WON BY 1 WICKET', 1006);
INSERT INTO admin.FIXTURE VALUES(904, 'CSK', 'RR', 1107, TO_DATE('2021-05-28 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'CSK', 'WON BY 3 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(905, 'CSK', 'SRH', 1101, TO_DATE('2021-05-29 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'CSK', 'WON BY 6 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(906, 'CSK', 'KXIP', 1101, TO_DATE('2021-05-30 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KXIP', 'WON BY 2 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(907,  'RCB', 'MI', 1104, TO_DATE('2021-05-31 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RCB', 'WON BY 10 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(908,  'RCB', 'KKR', 1100, TO_DATE('2021-06-01 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RCB', 'WON BY 10 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(909,  'RCB', 'DC', 1104, TO_DATE('2021-06-02 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'DC', 'WON BY 5 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(910,  'RCB', 'RR', 1107, TO_DATE('2021-06-03 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RR', 'WON BY 10 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(911,  'RCB', 'SRH', 1104, TO_DATE('2021-06-04 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RCB', 'WON BY 9 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(912,  'RCB', 'KXIP', 1105, TO_DATE('2021-06-05 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KXIP', 'WON BY 1 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(913,  'MI', 'KKR', 1103, TO_DATE('2021-06-06 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KKR', 'WON BY 10 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(914,  'MI', 'DC', 1102, TO_DATE('2021-06-07 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'MI', 'WON BY 10 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(915,  'MI', 'RR', 1103, TO_DATE('2021-06-08 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'MI', 'WON BY 1 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(916,  'MI', 'SRH', 1106, TO_DATE('2021-06-09 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'SRH', 'WON BY 4 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(917,  'MI', 'KXIP', 1105, TO_DATE('2021-06-10 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KXIP', 'WON BY 10 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(918,  'KKR', 'DC', 1100, TO_DATE('2021-06-11 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KKR', 'WON BY 1 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(919,  'KKR', 'RR', 1107, TO_DATE('2021-06-12 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RR', 'WON BY 8 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(920,  'KKR', 'SRH', 1100, TO_DATE('2021-06-13 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KKR', 'WON BY 1 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(921,  'KKR', 'KXIP', 1105, TO_DATE('2021-06-14 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KXIP', 'WON BY 3 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(922,  'DC', 'RR', 1102, TO_DATE('2021-06-15 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'DC', 'WON BY 10 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(923,  'DC', 'SRH', 1106, TO_DATE('2021-06-16 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'SRH', 'WON BY 5 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(924,  'DC', 'KXIP', 1102, TO_DATE('2021-06-17 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'DC', 'WON BY 1 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(925,  'RR', 'SRH', 1107, TO_DATE('2021-06-18 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RR', 'WON BY 5 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(926,  'RR', 'KXIP', 1105, TO_DATE('2021-06-19 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KXIP', 'WON BY 8 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(927,  'SRH', 'KXIP', 1105, TO_DATE('2021-06-20 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KXIP', 'WON BY 7 WICKETS', 1006);
INSERT INTO admin.FIXTURE VALUES(928, 'CSK', 'RCB', 1101, TO_DATE('2020-05-24 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RCB', 'WON BY 10 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(929, 'CSK', 'MI', 1103, TO_DATE('2020-05-25 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'CSK', 'WON BY 8 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(930, 'CSK', 'KKR', 1101, TO_DATE('2020-05-26 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KKR', 'WON BY 9 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(931, 'CSK', 'DC', 1102, TO_DATE('2020-05-27 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'CSK', 'WON BY 1 WICKET', 1005);
INSERT INTO admin.FIXTURE VALUES(932, 'CSK', 'RR', 1107, TO_DATE('2020-05-28 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RR', 'WON BY 3 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(933, 'CSK', 'SRH', 1101, TO_DATE('2020-05-29 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'SRH', 'WON BY 6 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(934, 'CSK', 'KXIP', 1101, TO_DATE('2020-05-30 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'CSK', 'WON BY 2 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(935,  'RCB', 'MI', 1104, TO_DATE('2020-05-31 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'MI', 'WON BY 10 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(936,  'RCB', 'KKR', 1100, TO_DATE('2020-06-01 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KKR', 'WON BY 10 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(937,  'RCB', 'DC', 1104, TO_DATE('2020-06-02 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RCB', 'WON BY 5 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(938,  'RCB', 'RR', 1107, TO_DATE('2020-06-03 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RCB', 'WON BY 10 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(939,  'RCB', 'SRH', 1104, TO_DATE('2020-06-04 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'SRH', 'WON BY 9 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(940,  'RCB', 'KXIP', 1105, TO_DATE('2020-06-05 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RCB', 'WON BY 1 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(941,  'MI', 'KKR', 1103, TO_DATE('2020-06-06 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'MI', 'WON BY 10 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(942,  'MI', 'DC', 1102, TO_DATE('2020-06-07 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'DC', 'WON BY 10 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(943,  'MI', 'RR', 1103, TO_DATE('2020-06-08 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RR', 'WON BY 1 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(944,  'MI', 'SRH', 1106, TO_DATE('2020-06-09 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'MI', 'WON BY 4 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(945,  'MI', 'KXIP', 1105, TO_DATE('2020-06-10 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'MI', 'WON BY 10 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(946,  'KKR', 'DC', 1100, TO_DATE('2020-06-11 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'DC', 'WON BY 1 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(947,  'KKR', 'RR', 1107, TO_DATE('2020-06-12 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KKR', 'WON BY 8 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(948,  'KKR', 'SRH', 1100, TO_DATE('2020-06-13 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'SRH', 'WON BY 1 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(949,  'KKR', 'KXIP', 1105, TO_DATE('2020-06-14 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KKR', 'WON BY 3 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(950,  'DC', 'RR', 1102, TO_DATE('2020-06-15 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RR', 'WON BY 10 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(951,  'DC', 'SRH', 1106, TO_DATE('2020-06-16 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'DC', 'WON BY 5 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(952,  'DC', 'KXIP', 1102, TO_DATE('2020-06-17 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'KXIP', 'WON BY 1 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(953,  'RR', 'SRH', 1107, TO_DATE('2020-06-18 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'SRH', 'WON BY 5 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(954,  'RR', 'KXIP', 1105, TO_DATE('2020-06-19 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'RR', 'WON BY 8 WICKETS', 1005);
INSERT INTO admin.FIXTURE VALUES(955,  'SRH', 'KXIP', 1105, TO_DATE('2020-06-20 23:30:00', 'yyyy-MM-dd hh24:mi:ss'), 'SRH', 'WON BY 7 WICKETS', 1005);
COMMIT;





--Insert Team_Standings values into Team_Standings Table

INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,6,1,0,0,12,1006,'KXIP');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,4,3,0,0,8,1006,'CSK');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,4,3,0,0,8,1006,'DC');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,3,4,0,0,6,1006,'RCB');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,3,4,0,0,6,1006,'MI');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,3,4,0,0,6,1006,'RR');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,3,4,0,0,6,1006,'KKR');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,2,5,0,0,4,1006,'SRH');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,5,2,0,0,12,1005,'SRH');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,4,3,0,0,8,1005,'RCB');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,4,3,0,0,8,1005,'MI');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,4,3,0,0,6,1005,'RR');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,4,3,0,0,6,1005,'KKR');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,3,4,0,0,6,1005,'CSK');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,3,4,0,0,6,1005,'DC');
INSERT INTO admin.team_standings VALUES (TEAM_STANDINGS_SEQ.NEXTVAL,7,1,6,0,0,4,1005,'KXIP');

COMMIT;



--Insert Ticket_Class values into Ticket_Class Table

INSERT INTO admin.TICKET_CLASS VALUES (admin.TICKET_CLASS_SEQ.nextval, 'SILVER', 30);
INSERT INTO admin.TICKET_CLASS VALUES (admin.TICKET_CLASS_SEQ.nextval, 'GOLD', 50);
INSERT INTO admin.TICKET_CLASS VALUES (admin.TICKET_CLASS_SEQ.nextval, 'PLATINUM', 100);

COMMIT;


----Insert Booking values into Booking Table

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2000, 500, 4, 1006);
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2000, 501, 2 , 1006);
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,900, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2000, 500, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 509, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2000, 516, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2000, 518, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2002, 521, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 523, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 527, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,901, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2000, 502, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 504, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2002, 505, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 509, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2002, 514, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 519, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 524, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2001, 528, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,902, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2000, 501, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2002, 505, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 508, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2002, 510, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2000, 515, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 519, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 522, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2002, 525, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,903, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2000, 500, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2000, 503, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 507, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2002, 510, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2000, 517, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2002, 521, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2002, 525, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,904, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2000, 500, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2000, 503, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 507, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 512, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 519, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 524, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2001, 528, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,905, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2000, 501, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2002, 505, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 508, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2002, 510, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2002, 514, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 519, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 523, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 527, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,906, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2000, 503, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 507, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2002, 510, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2000, 516, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 524, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2001, 528, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,907, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2000, 502, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2002, 505, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 507, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2002, 510, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2000, 515, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2002, 520, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 524, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,908, 2002, 529, 15, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2000, 502, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 507, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 513, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2000, 518, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 522, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2002, 525, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,909, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2000, 501, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2002, 506, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 512, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2000, 517, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 522, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2001, 528, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,910, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2000, 503, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 509, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2000, 515, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2000, 518, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 519, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2002, 525, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,911, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2000, 500, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 508, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2002, 514, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2000, 516, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 522, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 527, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,912, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2000, 500, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2002, 505, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 512, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 519, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 523, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2001, 528, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,913, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2000, 503, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 508, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2002, 514, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 522, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 527, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,914, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2000, 500, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 508, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2000, 515, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 523, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2001, 528, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,915, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2000, 503, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 508, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2000, 517, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 522, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2001, 528, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,916, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2000, 503, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 509, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2000, 516, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2002, 525, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,917, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2000, 501, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 508, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2000, 515, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 522, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 527, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,918, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2000, 502, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2002, 506, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2002, 510, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2000, 516, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 522, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,919, 2002, 529, 15, 1006 );


INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2002, 505, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2000, 515, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 519, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 524, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 527, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,920, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2000, 501, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2002, 506, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2002, 510, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2000, 517, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 522, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2001, 528, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,921, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2002, 505, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2000, 517, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2002, 521, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2002, 525, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,922, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2000, 503, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 507, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2000, 515, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2000, 518, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2002, 521, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2001, 528, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,923, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2000, 503, 16, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2002, 510, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2002, 520, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 527, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,924, 2002, 529, 15, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 504, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 508, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 513, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2002, 520, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2002, 525, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,925, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2000, 500, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2000, 502, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2002, 505, 13, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 508, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2002, 510, 15, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2000, 517, 1, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 519, 14, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 522, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 524, 12, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2001, 528, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,926, 2002, 529, 5, 1006 );

INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2000, 500, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2000, 501, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2000, 502, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2000, 503, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 504, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2002, 505, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2002, 506, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 507, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 508, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 509, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2002, 510, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 511, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 512, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 513, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2002, 514, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2000, 515, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2000, 516, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2000, 517, 11, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2000, 518, 6, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 519, 4, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2002, 520, 3, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2002, 521, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 522, 18, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 523, 7, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 524, 2, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2002, 525, 5, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 526, 10, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 527, 8, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2001, 528, 17, 1006 );
INSERT INTO admin.booking values(admin.booking_seq.NEXTVAL  ,927, 2002, 529, 5, 1006 );

COMMIT;




--View to show the details of players and respective teams with their bid amount

CREATE OR REPLACE VIEW TEAM_PLAYER AS
select pl.player_name, pl.base_price,pl.player_role,pl.player_type,bid.bid_amount, ow.team_name as bought_by from ADMIN.bid bid
inner join ADMIN.team_owner ow on ow.owner_id=bid.owner_id
inner join ADMIN.player pl on pl.player_id=bid.player_id
where bid.is_final_bid='T';

--View to display the venue, teams and winners

CREATE OR REPLACE VIEW VENUE_WINNER AS
select lg.league_name,fx.team1_id, fx.team2_id, vn.venue_name, fx.winner from fixture fx
join venue vn on fx.venue_id = vn.venue_id
join league lg on fx.league_id = lg.league_id;

--View to shows the details different fixtures and bookings of fixtures

CREATE OR REPLACE VIEW FIXTURE_BOOKINGS AS
select bk.booking_id,fx.match_id,fx.team1_id, fx.team2_id, vn.venue_name, bk.ticket_count, ticket.ticket_type,fx.league_id from fixture fx
join booking bk on fx.match_id = bk.match_id
join ticket_class ticket on bk.ticket_type_id = ticket.ticket_id
join venue vn on fx.venue_id = vn.venue_id;

--View to dispaly bids and payments of players and owners

CREATE OR REPLACE VIEW PLAYER_PAYMENT AS
select pl.player_name, ow.owner_name, bid.bid_amount as paid_amount, pay.reference_num as transaction_id from payment pay
join bid bid on pay.bid_id = bid.bid_id
join team_owner ow on bid.owner_id = ow.owner_id  
join player pl on pl.player_id = pay.player_id;

--View to display the schedule of the league

CREATE OR REPLACE VIEW FIXTURE_SCHEDULE AS
select fx.match_id, fx.team1_id, fx.team2_id,vn.venue_name,vn.city, fx.match_date, fx.league_id
from fixture fx join venue vn on fx.venue_id = vn.venue_id;

----------------------------------------------------------------------------------------------------------------------------
--This package is used to registration/updation/authentication of user

--For authentication use createOrUpdateUser procedure - usertype (PLAYER/OWNER/AUDIENCE)

--SET SERVEROUTPUT ON;
--EXECUTE user_reg_auth.authenticate_user('Blake','Blake@1996','AUDIENCE');

--For registartion/updation use createOrUpdateUser procedure

--SET SERVEROUTPUT ON;
--EXECUTE user_reg_auth.createOrUpdateUser('AUDIENCE','King', 'King@1993',29,'MALE','kingsarath123@gmail.com','7623456298');
------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE user_reg_auth AS 
   PROCEDURE createOrUpdateUser(
                utype IN VARCHAR2,
                uname IN VARCHAR2,
                pwd IN VARCHAR2,
                user_age IN NUMBER,
                user_sex IN VARCHAR2,
                mail IN VARCHAR2,
                mobile IN VARCHAR2
                ) ;
    PROCEDURE authenticate_user(uname in user_account.username%type, pwd in user_account.user_pwd%type, utype in user_account.user_type%type);
END user_reg_auth; 
/

CREATE OR REPLACE PACKAGE BODY user_reg_auth AS 

PROCEDURE createOrUpdateUser(
utype IN VARCHAR2,
uname IN VARCHAR2,
pwd IN VARCHAR2,
user_age IN NUMBER,
user_sex IN VARCHAR2,
mail IN VARCHAR2,
mobile IN VARCHAR2
)
IS
v_user_id NUMBER := 0;
v_userNameAlreadyTaken NUMBER := 0;
userNameAlreadyTakenEx EXCEPTION;
v_max_userid NUMBER := 0;
userExists NUMBER:=0;
newUserID VARCHAR2(20);
BEGIN
    IF utype is null or uname is null or pwd is null or user_age is null or user_sex is null or mail is null or mobile is null
    then
        dbms_output.put_line('Cannot accept null fields');
        RETURN;
    END IF;
    IF utype NOT IN ('PLAYER','OWNER', 'AUDIENCE')
        THEN
            dbms_output.put_line('Please select a user type in PLAYER/OWNER/AUDIENCE');
            RETURN;
        END IF;
        If not regexp_like(uname,'^.*[a-zA-Z].*$')  
        then
            dbms_output.put_line('Invalid username');
            RETURN;
        end if;
        if NOT regexp_like(pwd,'^.*[A-Z].*$')and regexp_like(pwd,'^.*[0-9].*$') and regexp_like(pwd,'^.*[^A-Z,0-9].*$')
        then
            raise_application_error(-20000, 'Password must include a mix of letters, numbers, and special characters');
            RETURN;
        end if;
        IF NOT REGEXP_LIKE(user_age, '^[[:digit:]]+$') THEN 
            dbms_output.put_line('Invalid age');
        END IF;
        IF NOT REGEXP_LIKE (mail, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')
        THEN
            DBMS_OUTPUT.put_line ('Email address is invalid');
        RETURN;
        END IF;
        IF NOT REGEXP_LIKE(mobile, '^(\(\d{3}\))([[:blank:]])\d{3}-\d{4}$|^\d{3}(-)\d{3}(-)\d{4}$|^\d{10}$') THEN 
            dbms_output.put_line('Invalid phone number');
        RETURN;
        END IF;
    SELECT COUNT(1) INTO userExists FROM USER_ACCOUNT WHERE username = uname and user_type = utype;
    IF userExists > 0
    THEN
        UPDATE USER_ACCOUNT 
        SET USER_PWD = pwd
        WHERE username = uname;
    ELSE
        SELECT COUNT(1) INTO v_userNameAlreadyTaken FROM USER_ACCOUNT WHERE username = uname and user_type = utype;
        IF v_userNameAlreadyTaken > 0
            THEN RAISE userNameAlreadyTakenEx;
        END IF;
        SELECT MAX(user_id) INTO v_max_userid FROM USER_ACCOUNT;
        
        INSERT INTO USER_ACCOUNT VALUES (v_max_userid+1, utype, uname, pwd, user_age, user_sex, mail, mobile); 
        COMMIT;
    END IF;
    EXCEPTION
    WHEN userNameAlreadyTakenEx THEN
        DBMS_OUTPUT.PUT_LINE('User Name Already Taken. Please try with another user name');
END createOrUpdateUser;

PROCEDURE authenticate_user(uname in user_account.username%type, pwd in user_account.user_pwd%type, utype in user_account.user_type%type)
IS
v_username VARCHAR2(20);
v_password VARCHAR2(20);
v_user_type VARCHAR2(10);
BEGIN
IF utype is null or uname is null or pwd is null
then
    dbms_output.put_line('Cannot accept null fields');
    RETURN;
END IF;
SELECT username,user_pwd,user_type into v_username,v_password,v_user_type FROM user_account 
WHERE LOWER(username) = LOWER(uname) AND LOWER(user_pwd) = LOWER(pwd) AND LOWER(user_type) = LOWER(utype);

IF lower(v_username) = lower(uname) AND lower(v_password) = lower(pwd) AND lower(v_user_type) = lower(utype)
THEN
    dbms_output.put_line('User Authenticated...'|| 'Welcome ' || utype || ' Mr.' ||uname);
END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('Invalid username/password');

end authenticate_user;

end user_reg_auth;
/

------------------------------------------------------------------------------------------------------------------------------
--function to display list of players in each team
--Team id should be passed as input

--SET SERVEROUTPUT ON;
--variable c refcursor
--EXECUTE :c := list_players('RCB');
--print :c;
------------------------------------------------------------------------------------------------------------------------------

create or replace function list_players (v_team_id VARCHAR2 )
RETURN sys_refcursor AS
l_cursor sys_refcursor;
begin
if (v_team_id = '' or v_team_id is null)
then
    dbms_output.put_line('Team id cannot be empty');
end if;
if (v_team_id NOT IN ('RCB','CSK','DC','KXIP','BCCI','KKR','MI','RR','SRH'))
then
    dbms_output.put_line('Enter team id in RCB/CSK/DC/KXIP/BCCI/KKR/MI/RR/SRH');
end if;
  open l_cursor for 
    select player_name,player_role,player_type, bid_amount
    from TEAM_PLAYER
    where bought_by = (select team_name from team where LOWER(team_id) = LOWER(v_team_id)); 
  return l_cursor;
exception
    WHEN NO_DATA_FOUND
    THEN
        dbms_output.put_line('No Such Team');
end;
/

------------------------------------------------------------------------------------------------------------------------------
--Function to get bookings of each match
--Enter match id between 900 and 927

--SET SERVEROUTPUT ON;
--variable num_match_bookings NUMBER
--EXECUTE :num_match_bookings := match_num_bookings(920); 
--print :num_match_bookings;
------------------------------------------------------------------------------------------------------------------------------

create or replace function match_num_bookings(match_nm IN NUMBER)
RETURN NUMBER
AS
    v_bookings NUMBER:=0;
    v_min_id NUMBER:=0;
    v_max_id NUMBER:=0;
BEGIN
select min(match_id),max(match_id) INTO v_min_id,v_max_id from fixture;
if (match_nm = '' or match_nm is null)
then
    dbms_output.put_line('Match id cannot be empty');
end if; 
if not (match_nm between v_min_id and v_max_id)
then
    dbms_output.put_line('Enter match id between '|| v_min_id || 'and' || v_max_id || 'to get bookings');
end if;
select count(booking_id) INTO v_bookings
from fixture_bookings 
where match_id = match_nm
group by match_id;
DBMS_OUTPUT.PUT_LINE('No of bookings: ' || v_bookings);
RETURN v_bookings;
exception
    WHEN NO_DATA_FOUND
    THEN
        dbms_output.put_line('No match data found');
END;
/

------------------------------------------------------------------------------------------------------------------------------
--Function to get number of tickets sold per each match
--Enter match id between 900 and 927

SET SERVEROUTPUT ON;
variable num_match_bookings NUMBER
EXECUTE :num_match_bookings := match_num_bookings();
print :num_match_bookings;
------------------------------------------------------------------------------------------------------------------------------

create or replace function match_num_tickets(match_nm IN NUMBER)
RETURN NUMBER
AS
    v_bookings NUMBER := 0;
    v_min_id NUMBER:=0;
    v_max_id NUMBER:=0;
BEGIN
select min(match_id),max(match_id) INTO v_min_id,v_max_id from fixture;
if (match_nm = '' or match_nm is null)
then
    dbms_output.put_line('Match id cannot be empty');
end if; 
if not (match_nm between v_min_id and v_max_id)
then
    dbms_output.put_line('Enter match id between '|| v_min_id || 'and' || v_max_id || 'to get bookings');
end if;
select sum(ticket_count) INTO v_bookings
from fixture_bookings 
where match_id = match_nm
group by match_id;
DBMS_OUTPUT.PUT_LINE('No of bookings: ' || v_bookings);
RETURN v_bookings;
exception
    WHEN NO_DATA_FOUND
    THEN
        dbms_output.put_line('No match data found');
END;
/

------------------------------------------------------------------------------------------------------------------------------
--function to find the number of tickets of each type sold per match
--There are three types of tickets SILVER/GOLD/PLATINUM

--SET SERVEROUTPUT ON;
--variable tic_type refcursor;
--EXECUTE :tic_type := fixture_ticket_type_sold('SILVER');
--print :tic_type;
------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fixture_ticket_type_sold(tick_type VARCHAR2)
RETURN sys_refcursor AS
l_cursor sys_refcursor;
begin
if tick_type is null or tick_type = ''
then
    dbms_output.put_line('Ticket type cannot be empty');
end if;
if tick_type not in ('GOLD','SILVER','PLATINUM')
then
    dbms_output.put_line('select a ticket type in silver/gold/platinum');
end if;
  open l_cursor for 
    select sum(ticket_count) as num_tickets, match_id,team1_id,team2_id, ticket_type 
    from fixture_bookings where UPPER(ticket_type) = UPPER(tick_type)
    group by match_id,team1_id,team2_id,ticket_type;
  return l_cursor;

END;
/

------------------------------------------------------------------------------------------------------------------------------
--function to get the schedule of a league
--Inserted information for vivo ipl 2020, vivo ipl 2021

--SET SERVEROUTPUT ON;
--variable schedule refcursor;
--EXECUTE :schedule := getLeagueSchedule('Vivo IPL 2021');
--print :schedule;
------------------------------------------------------------------------------------------------------------------------------

create or replace FUNCTION getLeagueSchedule(league_nm IN VARCHAR2)
RETURN sys_refcursor AS
l_cursor sys_refcursor;
v_league_nm VARCHAR2(30) := replace(initcap(league_nm),' ');
begin
if league_nm is null or league_nm = ''
then
    dbms_output.put_line('League name cannot be null');
end if;
  open l_cursor for 
    select match_id,team1_id,team2_id,match_date,venue_name,city from FIXTURE_SCHEDULE
    where league_id = (select league_id from league where (replace(initcap(league_name),' ')) = v_league_nm) order by match_id;
  return l_cursor;
exception
    WHEN NO_DATA_FOUND
    THEN
        dbms_output.put_line('No Such League');
END;
/

------------------------------------------------------------------------------------------------------------------------------
--function to get the revenue generated in the whole league
--Inserted information for  vivo ipl 2021(1006)

--SET SERVEROUTPUT ON;
--variable l_rev NUMBER;
--EXECUTE :l_rev := league_revenue(1006);
--print :l_rev;
------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION league_revenue(league_num IN NUMBER)
RETURN NUMBER
AS 
    v_league_revenue NUMBER(10):=0;
    v_min_id NUMBER:=0;
    v_max_id NUMBER:=0;
BEGIN
select min(league_id),max(league_id) INTO v_min_id, v_max_id from league;
if league_num is null or league_num = ''
then
    dbms_output.put_line('League name cannot be null');
end if;
if not league_num between v_min_id and v_max_id
then
    dbms_output.put_line('Please enter a league number between ' || v_min_id || 'and' || v_max_id);
end if;
select sum(revenue) INTO v_league_revenue from (select fx.match_id as match_id, SUM(fx.ticket_count*tc.ticket_price) as revenue from ADMIN.fixture_bookings fx
join ADMIN.ticket_class tc on fx.ticket_type = tc.ticket_type
where league_id = league_num
group by match_id);

RETURN v_league_revenue;
exception
    WHEN NO_DATA_FOUND
    THEN
        dbms_output.put_line('No Such League');
END;
/

------------------------------------------------------------------------------------------------------------------------------
--Function to get the number of wins in each venue of a team
--Inserted information for vivo ipl 2020, vivo ipl 2021

--SET SERVEROUTPUT ON;
--variable wins refcursor;
--EXECUTE :wins := team_venue_wins('RCB','Vivo IPL 2021');
--print :wins;
------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION team_venue_wins(team_id VARCHAR2, league_nm VARCHAR)
RETURN sys_refcursor
AS
v_league_nm VARCHAR2(30):= replace(initcap(league_nm),' ');
l_cursor sys_refcursor;
BEGIN
if team_id is null or league_nm is null
then
    dbms_output.put_line('Input cannot be empty');
end if;
if (team_id NOT IN ('RCB','CSK','DC','KXIP','BCCI','KKR','MI','RR','SRH'))
then
    dbms_output.put_line('Enter team id in RCB/CSK/DC/KXIP/BCCI/KKR/MI/RR/SRH');
end if;

open l_cursor for 
    select venue_name,count(winner) from venue_winner 
    where winner = team_id and replace(initcap(league_name),' ') = v_league_nm 
    group by venue_name;
RETURN l_cursor;
exception
    WHEN NO_DATA_FOUND
    THEN
        dbms_output.put_line('No Such League/Team');
END;
/

------------------------------------------------------------------------------------------------------------------------------
--procedure to get the player information

--SET SERVEROUTPUT ON;
--EXECUTE get_player_info('Rayudu');
------------------------------------------------------------------------------------------------------------------------------

create or replace procedure get_player_info ( player_nm VARCHAR2 )
IS
v_role team_player.player_role%type;
v_team team_player.bought_by%type;
v_base_price team_player.base_price%type;
v_bid_amount team_player.bid_amount%type;
v_country player.country%type;
v_player_nm VARCHAR2(30) :=  replace(initcap(player_nm),' ');

begin
    dbms_output.put_line(v_player_nm);
    if (player_nm = '' or player_nm is null)
    then
        dbms_output.put_line('Player name cannot be empty...please enter the player name to get details');
        RETURN;
    end if;    
    select tp.player_role, tp.bought_by, tp.base_price, tp.bid_amount,pl.country into v_role, v_team, v_base_price, v_bid_amount, v_country
    from team_player tp join player pl
    on tp.player_name = pl.player_name
    where replace(initcap(pl.player_name),' ') = v_player_nm;
    
    DBMS_OUTPUT.PUT_LINE('Player Name: ' || v_player_nm);
    DBMS_OUTPUT.PUT_LINE('Team Name: ' || v_team);
    DBMS_OUTPUT.PUT_LINE('Role: ' || v_role);
    DBMS_OUTPUT.PUT_LINE('Country: ' || v_country);
    DBMS_OUTPUT.PUT_LINE('Base price: ' || v_base_price);
    DBMS_OUTPUT.PUT_LINE('Sold for: ' || v_bid_amount);
exception
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Player ' || player_nm || ' not found.');
end;
/

------------------------------------------------------------------------------------------------------------------------------
--procedure to check if a player is participating the league

--SET SERVEROUTPUT ON;
--EXECUTE playerAvailability('Dhoni');
------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE playerAvailability(player_nm VARCHAR2)
AS
v_player_count VARCHAR2(30);
v_player_nm VARCHAR2(30):= replace(initcap(player_nm),' ');
BEGIN
if (player_nm is null or player_nm = '')
THEN
    dbms_output.put_line('Player name cannot be empty');
    RETURN;
END IF;
select count(player_name) into v_player_count from player where replace(initcap(player_name),' ') = v_player_nm  ;

if (v_player_count = 1)
THEN 
    dbms_output.put_line('Player is available for bidding');
ELSE
    dbms_output.put_line('Player is currently unavailable and not participating in the league');
END IF;
exception
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Player ' || player_nm || ' not found.');
END;
/

------------------------------------------------------------------------------------------------------------------------------
--procedure to check if a player is sold out

--SET SERVEROUTPUT ON;
--EXECUTE isPlayerSold('DWAINEPRETORIUS');
------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE isPlayerSold(player_nm VARCHAR2)
AS
v_player_count VARCHAR2(30);
v_player_nm VARCHAR2(30):= replace(initcap(player_nm),' ');
v_player_name VARCHAR2(30);
BEGIN
if (player_nm is null or player_nm = '')
THEN
    dbms_output.put_line('Player name cannot be empty');
    RETURN;
END IF;
select count(player_name) into v_player_count 
from player where replace(initcap(player_name),' ') = v_player_nm and team_id = 'BCCI';

if (v_player_count = 1)
THEN 
    dbms_output.put_line('Player is available for bidding');
ELSE
    dbms_output.put_line('Player is aleady sold out');
END IF;
exception
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Player ' || player_nm || ' not found.');
END;
/

------------------------------------------------------------------------------------------------------------------------------
--procedure to place a new bid on a player

--SET SERVEROUTPUT ON;
--EXECUTE placeBid('SHIMRONHETMEYER','SharukhKhan',12230000,1006);
------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE placeBid(player_nm VARCHAR2, owner_nm VARCHAR2, bid_amnt NUMBER, league_num NUMBER)
AS
v_base_price NUMBER := 0;
v_team_id VARCHAR2(10);
v_max_bid_id NUMBER:=0;
v_allotted_amount NUMBER := 0;
v_player_id NUMBER := 0;
v_owner_id NUMBER := 0;
v_min_id NUMBER := 0;
v_max_id NUMBER := 0;
BEGIN
select min(league_id),max(league_id) INTO v_min_id, v_max_id from league;
if (player_nm = '' or player_nm is null or owner_nm = '' or owner_nm is null or league_num = '' or league_num is null)
then
    dbms_output.put_line('player/owner/league id cannot be empty');
    return;
end if;
if not (league_num between v_min_id and v_max_id)
then
    dbms_output.put_line('Please enter a league id between ' || v_min_id || 'and' || v_max_id);
    return;
end if;
if (league_num != 1006)
then
    dbms_output.put_line('Bid Information not available for this league');
    return;
end if;

select base_price, team_id,player_id INTO v_base_price, v_team_id,v_player_id from player where replace(initcap(player_name),' ') = replace(initcap(player_nm),' ');
select alloted_amount,owner_id INTO v_allotted_amount,v_owner_id from team_owner where replace(initcap(owner_name),' ') = replace(initcap(owner_nm),' ');
if (v_base_price>bid_amnt)
then
    dbms_output.put_line('Bid amount cannot be less than base price of the player');
    return;
end if;
if (v_allotted_amount<bid_amnt)
then
    dbms_output.put_line('You cannot place a bid greater than the allotted amount');
    return;
end if;
if (v_team_id!='BCCI')
then
    dbms_output.put_line('Player is already sold to another team');
    return;
end if;

SELECT MAX(bid_id) INTO v_max_bid_id FROM bid;
INSERT INTO BID values (v_max_bid_id+1,v_owner_id,v_player_id,sysdate,'F',bid_amnt,league_num);
COMMIT;
exception
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Player or owner not found.');
END;
/

--select * from team;

---select * from player where player_name = 'SHIMRONHETMEYER'

------------------------------------------------------------------------------------------------------------------------------
--procedure to place a new bid on a player

--SET SERVEROUTPUT ON;
--EXECUTE updateBid(765);
------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE updateBid(bid_num NUMBER)
AS
v_min_id NUMBER := 0;
v_max_id NUMBER := 0;

BEGIN
select min(bid_id),max(bid_id) into v_min_id,v_max_id from bid;
if (bid_num is null)
then
    dbms_output.put_line('Bid number cannot be null');
    return;
end if;
if not (bid_num between v_min_id and v_max_id)
then
    dbms_output.put_line('Bid number is not valid..Please enter a bid number between ' || v_min_id || 'and ' || v_max_id);
    return;
end if;
update BID set is_final_bid = 'T' where bid_id = bid_num;
commit;
END;
/
------------------------------------------------------------------------------------------------------------------------------
--Procedure to delete a user account - Admin can delete the users by using their user_id
--This procedure can be used to demonstrate the use of triggers deletePlayerAccount,deleteOwnerAccount,deleteAudienceAccount

--SET SERVEROUTPUT ON;
--EXECUTE deleteUserAccount(1);
------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE deleteUserAccount(user_num NUMBER)
AS
v_username VARCHAR2(30);
v_user_id NUMBER;
v_min_id NUMBER :=0;
v_max_id NUMBER :=0;

BEGIN

IF user_num is null or user_num = ''
then
    dbms_output.put_line('User id cannot be empty');
    return;
end if;
select min(user_id),max(user_id) into v_min_id, v_max_id from user_account;
IF user_num NOT between v_min_id and v_max_id
then
    dbms_output.put_line('User does not exist in database..Enter id between '||v_min_id||' and '||v_max_id);
    return;
end if;
dbms_output.put_line(user_num);
select username into v_username from user_account where user_id = user_num;
dbms_output.put_line(v_username);

delete from user_account where user_id = v_user_id;
commit;

dbms_output.put_line('User deleted successfully');
exception
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('User not found.');
END;
/

------------------------------------------------------------------------------------------------------------------------------
--Function to get the details of matches played by each team in the league

--SET SERVEROUTPUT ON;
--variable fixts refcursor;
--EXECUTE :fixts := getTeamFixtures('RCB',1006);
--print :fixts;
------------------------------------------------------------------------------------------------------------------------------

create or replace FUNCTION getTeamFixtures(teamid VARCHAR2, league_num NUMBER)
RETURN sys_refcursor AS
l_cursor sys_refcursor;
v_min_id NUMBER := 0;
v_max_id NUMBER := 0;
BEGIN
select min(league_id),max(league_id) INTO v_min_id, v_max_id from league;
if teamid is null or league_num is null
then
    dbms_output.put_line('Input cannot be empty');
end if;
if (teamid NOT IN ('RCB','CSK','DC','KXIP','BCCI','KKR','MI','RR','SRH'))
then
    dbms_output.put_line('Enter team id in RCB/CSK/DC/KXIP/BCCI/KKR/MI/RR/SRH');
end if;
if not (league_num between v_min_id and v_max_id)
then
    dbms_output.put_line('Please enter a league id between ' || v_min_id || 'and' || v_max_id);
end if;
if league_num NOT IN (1005,1006)
then
    dbms_output.put_line('Fixture Information not available for this league');
end if;
  open l_cursor for 
    select  match_date ,team1_id, team2_id, winner,win_details from fixture
    where (team1_id = teamid or team2_id = teamid) and league_id = league_num;
return l_cursor;

END;
/

------------------------------------------------------------------------------------------------------------------------------
--Procedure to get the winner of the league
--SET SERVEROUTPUT ON;
--EXECUTE leagueWinner('Vivo IPL 2020');
------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE leagueWinner(league_nm VARCHAR2)
AS
v_league_nm VARCHAR2(30) := replace(initcap(league_nm),' ');
v_team_id VARCHAR2(10);
BEGIN
if league_nm is null or league_nm = ''
then
    dbms_output.put_line('League name cannot be null');
    return;
end if;
select team_id into v_team_id from team_standings where league_id = (select league_id from league where replace(initcap(league_name),' ') = v_league_nm)
order by points desc fetch first row only;

dbms_output.put_line(v_team_id || ' won ' || league_nm);
exception
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('League info found.');
END;
/

----------------------------------------------------------------------------------------
--Procedure to add a new player into the player table
--For the player to get added to user account must be created
--Used max id +1 as player_id

--SET SERVEROUTPUT ON;
--EXECUTE addNewPlayer('ArjunTendulkar','Arjun','DOMESTIC','BOWLER','INDIA');
------------------------------------------------------------------------------------------

create or replace PROCEDURE addNewPlayer(
player_nm IN VARCHAR2, 
user_name IN VARCHAR2,   
v_player_type IN VARCHAR2, 
v_player_role IN VARCHAR2, 
v_country IN VARCHAR2)
AS
v_user_id NUMBER(10);
v_max_player_id NUMBER(10);
v_user_count NUMBER(10);
v_player_count NUMBER(10);
--v_player_nm VARCHAR2(30) := replace(initcap(player_nm));
BEGIN
if player_nm is null or user_name is null  or v_player_type is null or v_player_role is null or v_country is null
then
    dbms_output.put_line('Any field cannot be empty');
    return;
end if;
select user_id into v_user_id from user_account where username = user_name;
select count(user_id) into v_user_count from user_account where username = user_name;
--if v_user_id is null
--then 
   -- dbms_output.put_line('create a user account first');
   -- return;
--end if;
if v_user_count = 0
then 
    dbms_output.put_line('User Account does not exist');
    return;
end if;
select count(player_id) into v_player_count from player where replace(initcap(player_name),'') = replace(initcap(player_nm),'');
if v_user_count > 0
then 
    dbms_output.put_line('Player already exist');
    return;
end if;
select max(player_id) into v_max_player_id from player;

INSERT INTO player values(v_max_player_id+1, v_user_id, 'BCCI', player_nm, DEFAULT, v_player_type, v_player_role, v_country);
EXCEPTION
WHEN NO_DATA_FOUND
THEN
        dbms_output.put_line('Player not found in user account');

END;
/


-- Trigger to update owners purse after final bid is true

create or replace TRIGGER updateAmountAfterBid  
AFTER UPDATE ON BID
FOR EACH ROW
BEGIN

UPDATE TEAM_OWNER 
SET alloted_amount = alloted_amount - :old.bid_amount
where owner_id = :old.owner_id;

END;
/

-- trigger to remove a user(player) account when a player is deleted

create or replace TRIGGER removePlayerAccount
BEFORE DELETE ON user_Account
FOR EACH ROW
BEGIN
  DELETE FROM player WHERE user_id = :old.user_id ;
END;
/
-- trigger to remove a user(owner) account when a owner is deleted

create or replace TRIGGER removeOwnerAccount
BEFORE DELETE ON user_Account
FOR EACH ROW
BEGIN
  DELETE FROM team_owner WHERE user_id = :old.user_id ;
END;
/

-- trigger to remove a user(audience) account when a audience is deleted

create or replace TRIGGER removeAudienceAccount
BEFORE DELETE ON user_Account
FOR EACH ROW
BEGIN
  DELETE FROM audience WHERE user_id = :old.user_id ;
END;
/

-- trigger to update team_standings table after a fixture

create or replace TRIGGER matchWinner  
AFTER INSERT OR UPDATE ON FIXTURE
FOR EACH ROW
BEGIN

UPDATE TEAM_STANDINGS
SET TOTAL_MATCHES = TOTAL_MATCHES+1,
MATCHES_WON = MATCHES_WON+1,
POINTS = POINTS+2
WHERE TEAM_STANDINGS.TEAM_ID = :old.WINNER;

COMMIT;
END;
/
-- trigger to assign a player to a team

create or replace TRIGGER assignPlayer  
AFTER UPDATE ON BID
FOR EACH ROW
BEGIN

UPDATE PLAYER 
SET TEAM_ID = (SELECT team_id from team 
                where team_name = (SELECT TEAM_NAME 
                                    from TEAM_OWNER 
                                    where owner_id = :old.owner_id));

END;
/


--Revenue generated by each match in the league

select ma.match_id as match_id, te1.team_name ||' vs '|| te2.team_name as teams, SUM(bk.ticket_count*tc.ticket_price) as revenue from ADMIN.fixture ma
inner join ADMIN.booking bk on bk.match_id = ma.match_id
inner join ADMIN.ticket_class tc on bk.ticket_type_id = tc.ticket_id
inner join ADMIN.team te1 on ma.team1_id = te1.team_id
inner join ADMIN.team te2 on ma.team2_id = te2.team_id
group by ma.match_id, te1.team_name, te2.team_name
order by revenue desc;

--top 10 most expensive players in league

select pl.player_name, pl.base_price, bid.bid_amount, ow.team_name as bought_by from ADMIN.bid bid
inner join ADMIN.team_owner ow on ow.owner_id=bid.owner_id
inner join ADMIN.player pl on pl.player_id=bid.player_id
where bid.is_final_bid='T'
order by bid.bid_amount desc
fetch first 10 rows only;

--Number of players in each team, domestic or international, batsman vs bowler vs wk

select te.team_name, SUM(CASE WHEN pl.player_role='BATSMAN' THEN 1 ELSE 0 END) AS Batsman,  
SUM(CASE WHEN pl.player_role = 'BOWLER' THEN 1 ELSE 0 END) AS Bowler, 
SUM(CASE WHEN pl.player_role = 'WK' THEN 1 ELSE 0 END) AS WK, 
SUM(CASE WHEN pl.player_role = 'ALLROUNDER' THEN 1 ELSE 0 END) AS AllRounder,
SUM(CASE WHEN pl.player_type = 'DOMESTIC' THEN 1 ELSE 0 END) AS Domestic,
SUM(CASE WHEN pl.player_type = 'INTERNATIONAL' THEN 1 ELSE 0 END) AS International
from admin.player pl
inner join admin.team te on te.team_id=pl.team_id
group by te.team_name;


--Reports to show the money spent, remaining money with each owner after bidding

select ow.team_name, round(SUM(bid.bid_amount)/10000000,2) as amount_spent, round(50 - SUM(bid.bid_amount)/10000000,2) as purse_left from admin.bid bid
inner join admin.team_owner ow on ow.owner_id=bid.owner_id
where bid.is_final_bid='T'
group by ow.team_name;


--Each team and owner with their highest bid amount in the league

select ow.team_name, ow.owner_name, max(bid.bid_amount) as max_bid from admin.team_owner ow
left join admin.bid bid on bid.owner_id=ow.owner_id
where bid.is_final_bid='T'
group by ow.team_name, ow.owner_name;
