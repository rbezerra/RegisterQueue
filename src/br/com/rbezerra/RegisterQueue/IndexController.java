/**
 * *
 * Copyright (c) 2009 Caelum - www.caelum.com.br/opensource All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package br.com.rbezerra.RegisterQueue;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.rbezerra.RegisterQueue.DAO.RegistroDAO;
import br.com.rbezerra.RegisterQueue.Models.Registro;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@Resource
public class IndexController {

    private final Result result;
    //private RegistroDAO regDAO;

    public IndexController(Result result) {
        this.result = result;
    }

    @Path("/")
    public void index() {
        //result.include("variable", "VRaptor!");
    }

    public void adiciona(int numCaixasAtivos, int numClientes, String[] horaChegada, String[] tempoAtend[], int resultado) {

        try {
            Date dtahj = new Date();
            Registro reg = new Registro();
            reg.setData(dtahj);
            reg.setCaixasAtivos(numCaixasAtivos);
            reg.setNumClientes(numClientes);
            reg.setNumClientesEsp(resultado);

            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");

            HashMap<Timestamp, Timestamp> hm = new HashMap<Timestamp, Timestamp>();

            for (int i = 0; i < horaChegada.length; i++) {
                String time1 = dtahj + " " + horaChegada[i];
                String time2 = dtahj + " " + tempoAtend[i];
                Timestamp ts1 = java.sql.Timestamp.valueOf(time1);
                Timestamp ts2 = java.sql.Timestamp.valueOf(time2);
                hm.put(ts1, ts2);
            }

            reg.setAtendimentos(hm);

            // regDAO.add(reg);
            result.use(Results.logic()).redirectTo(IndexController.class).index();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }

    }

}
