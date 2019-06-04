/* 
    Document   : ServletPDF.java
    Created on : 2/06/2019, 8:22 PM
    Author     : Isabella Caldas
    
    Aquí se agregan los datos al pdf que se exporta
*/

package Servlets;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.Clock;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ServletPDF", urlPatterns = {"/ServletPDF"})
public class ServletPDF extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();
        try {

            try {
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs = null;

                Statement sta2 = null;
                ResultSet rs2 = null;        
                
                Statement sta3 = null;
                ResultSet rs3 = null;
                
                Class.forName("oracle.jdbc.driver.OracleDriver");
                cnx = (Connection) DriverManager.getConnection("jdbc:oracle:thin:@labsistemas.javerianacali.edu.co:1521:XE", "MEZA", "mdr20191");
                sta = (Statement) cnx.createStatement();
                sta2 = (Statement) cnx.createStatement();
                sta3 = (Statement) cnx.createStatement();

                String nameP = (String)request.getParameter("nombreProyecto"); //Aquí se obtiene el nombre del proyecto
                int idProyecto = Integer.parseInt(nameP);
                
                rs = sta.executeQuery("select * from introduccion inner join proyecto on (proyecto.idproyecto=introduccion.idproyecto) inner join requisito on(proyecto.idproyecto=requisito.idproyecto) inner join detallerequisito on(requisito.idrequisito=detallerequisito.idrequisito) where proyecto.idproyecto= '"+idProyecto+"'");
                rs2 = sta2.executeQuery("select usuario.nombre from usuario inner join usuxproye on (usuxproye.idusuario=usuario.idusuario) where usuxproye.idproyecto = '"+idProyecto+"'");
                rs3 = sta3.executeQuery("select * from proyecto inner join requisito on (proyecto.idproyecto=requisito.idproyecto) inner join detallerequisito on(requisito.idrequisito=detallerequisito.idrequisito) where proyecto.idproyecto = '"+idProyecto+"'");
                
                if (cnx != null) {
                    try {
                        Document documento = new Document(); //Aqui se crea el documento
                        PdfWriter.getInstance(documento, out);

                        documento.open();

                        Paragraph par1 = new Paragraph();
                        Font fontTitulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.BLACK); //Tipo de letra del titulo

                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));   
                        
                        while (rs.next())
                        {
                            par1.add(new Phrase(rs.getString(10), fontTitulo)); //Aqui se agrega el nombre del proyecto                            
                        
                        
                        par1.setAlignment(Element.ALIGN_CENTER);
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));                        
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));                        
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));
                        
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                        Date fecha = new Date();
                        
                        sdf.format(fecha);
                        par1.add(new Phrase(sdf.format(fecha), fontTitulo)); //Aqui se agrega el nombre del proyecto
                        par1.setAlignment(Element.ALIGN_CENTER);
                        
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));                        
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));                        
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));

                        int version = rs.getInt(7);
                        String versionString = Integer.toString(version);

                        par1.add(new Phrase("Version:", fontTitulo));
                        par1.add(new Phrase(versionString, fontTitulo));//Se agrgea la versión                        

                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));                        
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));                        
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));
                        
                        
                        while(rs2.next()){
                             par1.add(new Phrase(rs2.getString(1), fontTitulo)); //Aqui se agregan los colaboradores del proyecto                                
                        par1.add(new Phrase(Chunk.NEWLINE));
                        }
                                                
                        documento.add(par1); //Aqui se agrega el primer parrafo
                        documento.newPage(); //Crea una nueva página
                                               
                        Paragraph par2 = new Paragraph();

                        Font fontTitulos = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD, BaseColor.BLACK);
                        Font fontSubTitulos = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
                        Font fontContenido = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
                                                
                        par2.add(new Phrase("1. Introduccion", fontTitulos));
                        par2.add(new Phrase(Chunk.NEWLINE));
                        
                        par2.add(new Phrase("1.1 Propósito", fontSubTitulos));
                        par2.add(new Phrase(Chunk.NEWLINE));
                        
                        par2.add(new Phrase(rs.getString(2), fontContenido)); //Agrega el propósito
                        
                        par2.add(new Phrase(Chunk.NEWLINE));
                        par2.add(new Phrase(Chunk.NEWLINE));
                        
                        par2.add(new Phrase("1.3 Visión", fontSubTitulos));
                        par2.add(new Phrase(Chunk.NEWLINE));
                        
                        par2.add(new Phrase(rs.getString(3), fontContenido)); //Agrega la vision
                        
                        par2.add(new Phrase(Chunk.NEWLINE));
                        par2.add(new Phrase(Chunk.NEWLINE));                        

                        par2.add(new Phrase("1.4 Misión", fontSubTitulos));
                        par2.add(new Phrase(Chunk.NEWLINE));
                        
                        par2.add(new Phrase(rs.getString(4), fontContenido)); //Agrega la mision
                        
                        par2.add(new Phrase(Chunk.NEWLINE));
                        par2.add(new Phrase(Chunk.NEWLINE));      
  
                        par2.add(new Phrase("1.5 Alcance", fontSubTitulos));
                        par2.add(new Phrase(Chunk.NEWLINE));
                        
                        par2.add(new Phrase(rs.getString(5), fontContenido)); //Agrega el alcance
                        
                        par2.add(new Phrase(Chunk.NEWLINE));
                        par2.add(new Phrase(Chunk.NEWLINE));   
                        
                        par2.add(new Phrase("1.6 Definiciones, Siglas y abreviaciones", fontSubTitulos));
                        par2.add(new Phrase(Chunk.NEWLINE));
                        
                        par2.add(new Phrase(rs.getString(6), fontContenido)); //Agrega Definiciones, Siglas y abreviaciones
                        
                        par2.add(new Phrase(Chunk.NEWLINE));
                        par2.add(new Phrase(Chunk.NEWLINE));                          
                        par2.add(new Phrase(Chunk.NEWLINE));

                        documento.add(par2);
                        }
                        Paragraph par3 = new Paragraph();
                        
                        Font fontTitulos = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD, BaseColor.BLACK);
                        Font fontSubTitulos = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
                        Font fontContenido = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
                        
                        par3.add(new Phrase("2. Descripción Global", fontTitulos));
                        par3.add(new Phrase(Chunk.NEWLINE));
                        par3.add(new Phrase("En el presente documento se encontrará la información acerca de las características del producto de software, interfaces de usuario, interfaces del sistema, descripción de los requerimientos funcionales, no funcionales y del sistema, los cuales se representan mediante el siguiente formato:", fontContenido));
                        par3.add(new Phrase(Chunk.NEWLINE));
                        par3.add(new Phrase(Chunk.NEWLINE));
                        
                        documento.add(par3);
                        
                        while(rs3.next())
                        {
                            
                        PdfPCell cell5 = new PdfPCell(new Phrase(rs3.getString(2),fontTitulos));
                        cell5.setColspan(4);
                        PdfPCell cell6 = new PdfPCell(new Phrase("Descripción del Requerimiento"));
                        cell6.setColspan(3);
                        cell5.setBackgroundColor(BaseColor.GRAY);
                        PdfPTable table = new PdfPTable(4);
                        table.addCell(cell5);
                        table.addCell(new PdfPCell(new Phrase("Código",fontSubTitulos)));
                        table.addCell(new PdfPCell(new Phrase("Nombre",fontSubTitulos)));
                        table.addCell(new PdfPCell(new Phrase("Fecha",fontSubTitulos)));
                        table.addCell(new PdfPCell(new Phrase("Grado de Necesidad")));
                        table.addCell(new PdfPCell(new Phrase("Referencia de Requerimiento")));
                        table.addCell(new PdfPCell(new Phrase("Nombre de Requerimiento")));
                        table.addCell(new PdfPCell(new Phrase("Fecha de especificación")));
                        table.addCell(new PdfPCell(new Phrase("Importancia del Requerimiento")));
                        table.addCell(new PdfPCell(new Phrase("Descripción",fontSubTitulos)));
                        table.addCell(cell6);
                        table.addCell(new PdfPCell(new Phrase("Entradas",fontSubTitulos)));
                        table.addCell(new PdfPCell(new Phrase("Entradas del requerimiento")));
                        table.addCell(new PdfPCell(new Phrase("Restricciones",fontSubTitulos)));
                        table.addCell(new PdfPCell(new Phrase("Restricciones del requerimiento")));
                        table.completeRow();

                        documento.add(table);
                        
                        Paragraph par4 = new Paragraph();
                        par4.add(new Phrase(Chunk.NEWLINE));
                        par4.add(new Phrase(Chunk.NEWLINE)); 

                        par4.add(new Phrase("3. Requerimientos Específicos", fontTitulos));
                        par4.add(new Phrase(Chunk.NEWLINE));
                        
                        par4.add(new Phrase("3.1 Definición de Requisitos", fontSubTitulos));
                        par4.add(new Phrase(Chunk.NEWLINE));
                        
                        par4.add(new Phrase(rs3.getString(6), fontContenido));
                        par4.add(new Phrase(": ", fontContenido));
                        par4.add(new Phrase(rs3.getString(3), fontContenido));
                        
                        par4.add(new Phrase(Chunk.NEWLINE));
                        par4.add(new Phrase(Chunk.NEWLINE));
                        
                        par4.add(new Phrase("3.3 Requerimientos Funcionales", fontSubTitulos));
                        par4.add(new Phrase(Chunk.NEWLINE));
                        par4.add(new Phrase(Chunk.NEWLINE));
                        
                        documento.add(par4);
                        
                        PdfPCell cell1 = new PdfPCell(new Phrase(rs3.getString(2),fontTitulos));
                        cell1.setColspan(4);
                        PdfPCell cell2 = new PdfPCell(new Phrase(rs3.getString(3),fontContenido));
                        cell2.setColspan(3);
                        cell1.setBackgroundColor(BaseColor.GRAY);
                        PdfPTable table2 = new PdfPTable(4);

                        table2.addCell(new PdfPCell(new Phrase("Código",fontSubTitulos)));
                        table2.addCell(new PdfPCell(new Phrase("Nombre",fontSubTitulos)));
                        table2.addCell(new PdfPCell(new Phrase("Fecha",fontSubTitulos)));
                        table2.addCell(new PdfPCell(new Phrase("Grado de Necesidad",fontSubTitulos)));
                        table2.addCell(new PdfPCell(new Phrase(rs3.getString(6))));
                        table2.addCell(new PdfPCell(new Phrase(rs3.getString(7))));
                        table2.addCell(new PdfPCell(new Phrase(rs3.getString(5))));
                        table2.addCell(new PdfPCell(new Phrase(rs3.getString(14))));
                        table2.addCell(new PdfPCell(new Phrase("Descripción",fontSubTitulos)));
                        table2.addCell(cell2);
                        table2.addCell(new PdfPCell(new Phrase("Entradas",fontSubTitulos)));
                        table2.addCell(new PdfPCell(new Phrase(rs3.getString(17))));
                        table2.addCell(new PdfPCell(new Phrase("Restricciones",fontSubTitulos)));
                        table2.addCell(new PdfPCell(new Phrase(rs3.getString(18))));
                        table2.completeRow();
                        
                        documento.add(table2);

                        }

                        documento.close();

                    } catch (Exception e) {
                        e.getMessage();
                    }

                }
                sta3.close();
                rs3.close();
                sta2.close();
                rs2.close();
                sta.close();
                rs.close();
                cnx.close();
                


            } catch (Exception e) {
                e.printStackTrace();
            }

        } finally {
            out.close();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
