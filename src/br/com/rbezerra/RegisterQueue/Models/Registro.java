/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.rbezerra.RegisterQueue.Models;

import java.util.HashMap;

/**
 *
 * @author RBezerra
 */
public class Registro {
    int caixasAtivos;
    int numClientes;
    HashMap<Integer, Integer> atendimentos; //<momento da entrada, tempo no caixa>
    int numClientesEsp;

    public int getNumClientesEsp() {
        return numClientesEsp;
    }

    public void setNumClientesEsp(int numClientesEsp) {
        this.numClientesEsp = numClientesEsp;
    }

    public int getCaixasAtivos() {
        return caixasAtivos;
    }

    public void setCaixasAtivos(int caixasAtivos) {
        this.caixasAtivos = caixasAtivos;
    }

    public int getNumClientes() {
        return numClientes;
    }

    public void setNumClientes(int numClientes) {
        this.numClientes = numClientes;
    }

    public HashMap<Integer, Integer> getAtendimentos() {
        return atendimentos;
    }

    public void setAtendimentos(HashMap<Integer, Integer> atendimentos) {
        this.atendimentos = atendimentos;
    }
    
    
}