CREATE OR REPLACE FUNCTION atualiza_horas() RETURNS TRIGGER 
AS
$$
	DECLARE qtde integer;
	Declare aux varchar(20);
BEGIN
	select quantidade from horas_Complementares, aluno
	where (matricula_aluno = matricula) = new.quantidade into qtde;
	if matricula_Aluno = matricula then
		update aluno set horas_possuidas = new.horas_possuidas +qtde; 
	End if;
	return null;
END
$$ LANGUAGE plpgsql;


-------------------------------------------------------------------------------

CREATE TRIGGER atualiza_hora
AFTER INSERT OR UPDATE horas_complementares;
    FOR EACH ROW EXECUTE PROCEDURE atualiza_horas();
	

CREATE OR REPLACE FUNCTION deleta_hora() RETURNS TRIGGER 
AS
$$
	Declare qtde integer;
	Declare aux varchar(20);
BEGIN
	Select matricula_aluno from horas_complementares,aluno where matricula_aluno = maTRICULA INTO aux;
	select quantidade from horas_complementares,aluno where matricula_aluno = maTRICULA INTO QTDE;
	Update aluno set horas_possuidas =  horas_possuidas - qtde Where matricula = aux ;
	RETURN NULL;
END
$$
LANGUAGE plpgsql;

CREATE TRIGGER deleta_hora
BEFORE DELETE ON horas_complementares
    FOR EACH STATEMENT EXECUTE PROCEDURE deleta_hora();
