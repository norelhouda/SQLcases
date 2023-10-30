WITH EMAILLINKCLICKS AS (SELECT userid, 
       COUNT(*) AS num_link_clicks
FROM Frontendeventlog el 
WHERE eventid = 5 
GROUP BY userid )

SELECT num_link_clicks, COUNT(*) AS num_users 
FROM EMAILLINKCLICKS 
GROUP BY num_link_clicks
