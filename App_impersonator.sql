-- Think about your favorite apps, and pick one that stores your data- like a game that stores scores, an app that lets you post
--  updates, etc. Now in this project, you're going to imagine that the app stores your data in a SQL database (which is pretty 
--  likely!), and write SQL statements that might look like their own SQL.

-- CREATE a table to store the data.
-- INSERT a few example rows in the table.
-- Use an UPDATE to emulate what happens when you edit data in the app.
-- Use a DELETE to emulate what happens when you delete data in the app.

/* What does the app's SQL look like? */
/* yt upload your video */

CREATE TABLE uploads (id INTEGER PRIMARY KEY, title TEXT, upload_time INTEGER, views INTEGER, description TEXT);

INSERT INTO uploads (id, title, upload_time, views, description) VALUES (1, "my_video", 2335, 236, "my first upload");
INSERT INTO uploads (id, title, upload_time, views, description) VALUES (2, "news", 0912, 236, "this time on the news");
INSERT INTO uploads (id, title, upload_time, views, description) VALUES (3, "ULTRA MEGA SUPER TOTAL deluxe taste test", 1656, 4296, "3rd video celebration and surprise at the  end!");

UPDATE uploads SET description = "3rd video celebration and surprise at the  end! Wind an entertaining waste of time!" WHERE id = 3;

DELETE FROM uploads WHERE id = 1;
SELECT * FROM uploads;

