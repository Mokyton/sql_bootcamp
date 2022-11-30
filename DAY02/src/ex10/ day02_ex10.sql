SELECT table1.name person_name1,
       talbe2.name person_name2,
       table1.address common_address FROM person table1 INNER JOIN person talbe2 ON table1.address = talbe2.address
WHERE table1.id > talbe2.id AND table1.address = talbe2.address
ORDER BY person_name1,
         person_name2,
         common_address;