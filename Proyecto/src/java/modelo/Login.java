/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author germancaycedo
 */
public class Login {
    
    private String usuario;
    private String clave;
    private String proyecto;
    
    public Login(){
        usuario = "";
        clave = "";
        proyecto = "";
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
    
        public void setProyecto(String proyecto) {
        this.clave = proyecto;
    }
        
        public String getProyecto() {
        return proyecto;
    }
    
}
