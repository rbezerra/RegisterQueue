/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.rbezerra.RegisterQueue.DAO;

import br.com.caelum.vraptor.ioc.ApplicationScoped;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.ComponentFactory;
import com.mongodb.MongoClientURI;

/**
 *
 * @author RBezerra
 */
@Component
@ApplicationScoped
public class SessionFactory implements ComponentFactory<Session> {
    private static final String endereco = "mongodb://rbezerra:superfly90@ds027409.mongolab.com:27409/registerqueue";
    private final MongoClientURI uri = new MongoClientURI(endereco);
    
    public Session getInstance() {
        Session session = new Session(uri);
        return session;
    }

}
