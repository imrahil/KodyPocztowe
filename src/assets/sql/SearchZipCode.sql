SELECT id,
       kod,
       nazwa,
       miej,
       woj,
       adres,
       powiat,
       zakres,
       gmina
FROM main.kody
WHERE miej LIKE :city AND adres LIKE :street