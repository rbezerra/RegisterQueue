/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.rbezerra.RegisterQueue.DAO;

import br.com.rbezerra.RegisterQueue.Models.Registro;
import java.util.List;

/**
 *
 * @author RBezerra
 */
public interface RegistroDAO {
    /**
     * Adiciona um novo registro de fluxo ao banco
     * 
     * @param reg 
     */
    void add(Registro reg);
    
    /**
     * Retorna todos os registros cadastrados no banco
     * 
     * @return lista dos registros de fluxo
     */
    List<Registro> listar();

    
    
}
