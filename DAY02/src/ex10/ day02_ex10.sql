SELECT fn.name person_name1,
       Sn.name person_name2,
       fn.address common_address FROM person Fn INNER JOIN person Sn ON Fn.address = Sn.address
WHERE fn.id > Sn.id AND fn.address = sn.address
ORDER BY person_name1,
         person_name2,
         common_address;