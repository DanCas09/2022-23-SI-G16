-- Função auxiliar que recebe um id de um jogador e lança uma exceção caso este não
-- exista na base de dados
CREATE OR REPLACE FUNCTION dbo.throw_if_idJogador_does_not_exist(
  idJ INTEGER 
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM dbo.Jogador WHERE id = idJ
    ) THEN
        RAISE invalid_parameter_value USING MESSAGE = 'invalid_input_value';
    END IF;
END;
$$;

-- Função auxiliar que recebe um email de um jogador e lança uma exceção caso este já
-- exista na base de dados
CREATE OR REPLACE FUNCTION dbo.throw_if_emailOrUsernameOfJogador_already_exists(
  emailJ VARCHAR(255),
  usernameJ VARCHAR(255)
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM dbo.Jogador WHERE (email = emailJ OR username = usernameJ)
    ) THEN
        RAISE invalid_parameter_value USING MESSAGE = 'invalid_input_value';
    END IF;
END;
$$;

CREATE OR REPLACE FUNCTION dbo.throw_if_regiao_does_not_exist(
	nomeRegiao VARCHAR(255)
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
	IF NOT EXISTS(
		SELECT 1
		FROM dbo.Regiao WHERE nome = nomeRegiao
	) THEN
		RAISE invalid_parameter_value USING MESSAGE = 'invalid_input_value';
	END IF;
END;
$$;