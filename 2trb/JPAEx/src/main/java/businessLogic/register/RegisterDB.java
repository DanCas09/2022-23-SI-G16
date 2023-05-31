package businessLogic.register;

import businessLogic.executor.ExecutorDB;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import businessLogic.service.ParameterFunction;
import businessLogic.service.Service;
import model.Regiao;

public class RegisterDB {

    EntityManager em;
    public RegisterDB(EntityManager em) {
        this.em = em;
    }

    public void registerTotalJogosJogadorFunction() throws Exception {
        ParameterFunction idJogador = new ParameterFunction(Integer.class, ParameterMode.IN);
        ParameterFunction totalJogosParameter = new ParameterFunction(Integer.class, ParameterMode.OUT);

        ParameterFunction[] funArgs = { idJogador, totalJogosParameter };

        Service.registerFunction("dbo.totalJogosJogador", funArgs, em);
    }

    public void registerTotalPontosJogadorFunction() throws Exception {
        ParameterFunction idJogador = new ParameterFunction(Integer.class, ParameterMode.IN);
        ParameterFunction totalPontosParameter = new ParameterFunction(Integer.class, ParameterMode.OUT);

        ParameterFunction[] funArgs = { idJogador, totalPontosParameter };

        Service.registerFunction("dbo.totalPontosJogador", funArgs, em);
    }



}
