/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.rbezerra.RegisterQueue.DAO;

import br.com.caelum.vraptor.ioc.Component;
import br.com.rbezerra.RegisterQueue.Models.Registro;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.WriteResult;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.catalina.Session;

/**
 *
 * @author RBezerra
 */

@Component
public class DefaultRegistroDAO implements RegistroDAO {

    private DBCollection collectionReg;

    public DefaultRegistroDAO(DBCollection collectionReg) {
        this.collectionReg = collectionReg;
    }

    public void add(Registro reg) {
        if (reg == null) {
            throw new IllegalArgumentException("o registro nao deve ser nulo");
        }

        BasicDBObject documentoReg = createRegObject(reg);
        WriteResult insert = collectionReg.insert(documentoReg);
        Object object = insert.getField("_id");
        reg.setData((Date) object);
        System.out.println(reg.getData());
    }

    private BasicDBObject createRegObject(Registro reg) {
        BasicDBObject documentoReg = new BasicDBObject();

        documentoReg.put("caixas_ativos", reg.getCaixasAtivos());
        documentoReg.put("num_clientes", reg.getNumClientes());
        documentoReg.put("clientes_esperando", reg.getNumClientesEsp());
        documentoReg.put("atendimentos", reg.getAtendimentos());

        return documentoReg;
    }

    public List<Registro> listar() {
        List<Registro> atendimentos = new ArrayList<Registro>();
        DBCursor cursor = collectionReg.find();
        while(cursor.hasNext()){
            atendimentos.add((Registro)cursor.next());
        }
        
        return atendimentos;
    }

}
