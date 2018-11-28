package snippet;

public class Snippet {
	SELECT id, mname, tel, email, zipcode, address1, address2,
	fname,  r
	from(
	SELECT id, mname, tel, email, zipcode, address1, address2,
	fname, rownum r
	from(
	SELECT id, mname, tel, email, zipcode, address1, 
	address2, fname
	FROM member
	where mname like '%홍%'
	ORDER BY mdate DESC 
	)
	)where r >= 1 and r <= 5
}

