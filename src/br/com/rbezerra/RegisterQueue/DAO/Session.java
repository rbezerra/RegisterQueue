/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.rbezerra.RegisterQueue.DAO;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoException;
import java.net.UnknownHostException;
import java.util.Set;

/**
 *
 * @author RBezerra
 */
public class Session {

    private static final String REGISTROS = "registros";
    
    
    private final MongoClient client;
    private static DB db; 

    public Session(MongoClientURI uri) {
        try {
            client = new MongoClient(uri);
            db = client.getDB("registerqueue");
        } catch (UnknownHostException e) {
            throw new IllegalArgumentException(uri.getURI());
        } catch (MongoException e) {
            throw new IllegalArgumentException(uri.getURI());
        }
    }

    public void getCollection() {
        Set<String> colls = db.getCollectionNames();

        for (String s : colls) {
            System.out.println(s);
        }
    }

}
