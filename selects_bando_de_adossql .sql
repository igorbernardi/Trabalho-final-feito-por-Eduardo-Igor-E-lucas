select codpac, nomepac
	from paciente 
	where extract (year from age(CURRENT_DATE, datanasc)) / 2 = 1 
	order by nomepac asc;

select paciente.nomepac, cidade.nomecid from paciente
inner join endereco on endereco.codpac = paciente.codpac
inner join cidade on cidade.codcid = endereco.codcid
where paciente.peso > 80 and 
(
	cidade.nomecid in ('Maravilha','Descanso','Pinhalzinho','Chapecó','Itapiranga')
);

select cidade.codcid, cidade.nomecid, COUNT(paciente.suspeito) from paciente
inner join endereco on endereco.codpac = paciente.codpac
inner join cidade on cidade.codcid = endereco.codcid
group by cidade.codcid, cidade.nomecid
having COUNT(paciente.suspeito) > 0
order by COUNT(paciente.suspeito) desc;

select extract (year from age(CURRENT_DATE, datanasc)) as idade, COUNT(paciente.suspeito) from paciente
where extract (year from age(CURRENT_DATE, datanasc)) < 10
group by paciente.datanasc
order by COUNT(paciente.suspeito) desc;



