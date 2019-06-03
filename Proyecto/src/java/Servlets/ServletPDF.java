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

                Class.forName("oracle.jdbc.driver.OracleDriver");
                cnx = (Connection) DriverManager.getConnection("jdbc:oracle:thin:@labsistemas.javerianacali.edu.co:1521:XE", "MEZA", "mdr20191");

                sta = (Statement) cnx.createStatement();
                rs = sta.executeQuery("select * from proyecto inner join usuXProye on (proyecto.idProyecto = usuXProye.idProyecto) inner join usuario on(usuXProye.idUsuario = usuario.idUsuario) where usuario.usuario = 'icaldasr'");

                if (cnx != null) {
                    try {
                        Document documento = new Document();
                        PdfWriter.getInstance(documento, out);

                        documento.open();

                        Paragraph par1 = new Paragraph();
                        Font fontTitulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.BLUE);

                        par1.add(new Phrase("Reporte de requerimientos", fontTitulo));

                        par1.setAlignment(Element.ALIGN_CENTER);
                        par1.add(new Phrase(Chunk.NEWLINE));
                        par1.add(new Phrase(Chunk.NEWLINE));

                        documento.add(par1);

                        Paragraph par2 = new Paragraph();

                        Font fontContenido = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);

                        par2.add(new Phrase("Este es el contenido de la pagina", fontContenido));

                        par1.setAlignment(Element.ALIGN_JUSTIFIED);
                        par1.add(new Phrase(Chunk.NEWLINE));

                        documento.add(par2);

                        PdfPTable tabla = new PdfPTable(3);

                        PdfPCell celda1 = new PdfPCell(new Paragraph("nada", FontFactory.getFont("Arial", 12, BaseColor.RED)));;
                        PdfPCell celda2 = new PdfPCell(new Paragraph("Codigo", FontFactory.getFont("Arial", 12, BaseColor.RED)));
                        PdfPCell celda3 = new PdfPCell(new Paragraph("Codigo", FontFactory.getFont("Arial", 12, BaseColor.RED)));

                        tabla.addCell(celda1);
                        tabla.addCell(celda2);
                        tabla.addCell(celda3);

                        documento.add(tabla);

                        Paragraph par3 = new Paragraph();

                        String nombre = request.getParameter("txtn");

                        par3.setAlignment(Element.ALIGN_JUSTIFIED);
                        par3.add(new Phrase(Chunk.NEWLINE));

                        while (rs.next()) {
                            par3.add(new Phrase(rs.getString(2), fontContenido));
                        }

                        documento.add(par3);

                        documento.close();

                    } catch (Exception e) {
                        e.getMessage();
                    }

                }
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
