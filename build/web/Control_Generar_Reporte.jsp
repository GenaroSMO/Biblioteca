<%-- 
    Document   : Control_Generar_Reporte
    Created on : 31/05/2019, 11:00:40 AM
    Author     : alumno04
--%>

<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.poi.xwpf.usermodel.UnderlinePatterns"%>
<%@page import="org.apache.poi.xwpf.usermodel.XWPFRun"%>
<%@page import="org.apache.poi.xwpf.usermodel.TextAlignment"%>
<%@page import="org.apache.poi.xwpf.usermodel.ParagraphAlignment"%>
<%@page import="org.apache.poi.xwpf.usermodel.XWPFParagraph"%>
<%@page import="org.apache.poi.xwpf.usermodel.XWPFDocument"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Biblioteca.Unpa.LB.EL.Alumno"%>
<%@page import="java.util.List"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<%
    System.out.println("************************************ REPORTE **************************************************");
    String FechaFin = request.getParameter("FechaFin");
    String FechaInicio = request.getParameter("FechaInicio");

    int horas_restantes = Integer.parseInt(request.getParameter("Horas_Restantes"));

    int numColumnas = 0;
    List<Alumno> Reporte = new ArrayList<Alumno>();

    try {
        // TEST_Registro_De_Horas TR = new TEST_Registro_De_Horas();
        TEST_Alumno ta = new TEST_Alumno();
        Reporte = ta.Reporte(FechaFin, FechaInicio);

        if (Reporte.get(0).getNombre().equals("0")) {
%>
<jsp:forward page="Alumno_Generar_Reporte.jsp"> 
    <jsp:param name="mensaje" value="Aun no llegas a esa fecha de corte de horas" />
</jsp:forward>
<%
    }

    if (Reporte.get(0).getNombre().equals("1")) {
%>
<jsp:forward page="Alumno_Generar_Reporte.jsp"> 
    <jsp:param name="mensaje" value="Fecha del corte del reporte no es viernes" />
</jsp:forward>
<%
    }

    if (Reporte.get(0).getNombre().equals("2")) {
%>
<jsp:forward page="Alumno_Generar_Reporte.jsp"> 
    <jsp:param name="mensaje" value="La fecha de Inicio de reporte es menor que la de fecha de corte del reporte , debe de tener una diferencia de una semana al menos" />
</jsp:forward>
<%
    }

    if (Reporte.get(0).getNombre().equals("3")) {
%>
<jsp:forward page="Alumno_Generar_Reporte.jsp"> 
    <jsp:param name="mensaje" value="La fecha de inicio del reporte no es lunes" />
</jsp:forward>
<%
        }

        numColumnas = Reporte.size();

        if (Reporte != null) {
            // System.out.println("Num columnas: " + numColumnas);
            try {

                String contenido = "";

                // Si el archivo no existe es creado
                String nombres = "";
                String cadena = "                                                                                             ";
                String carrera = Reporte.get(0).getCarrera();
                int semestre = Integer.parseInt(Reporte.get(0).getSemestre());
                contenido = contenido + "                   				" + semestre + "      " + carrera + "                                          ";

                nombres = Reporte.get(0).getMatricula() + " " + Reporte.get(0).getAP_Paterno() + " " + Reporte.get(0).getAP_Materno() + " " + Reporte.get(0).getNombre() + " ";
                contenido = contenido + nombres + cadena.substring(0, cadena.length() - nombres.length()) + " " + Reporte.get(0).getHE() + " " + (Integer.parseInt(Reporte.get(0).getHA()) - horas_restantes) + "\n";

                for (int b = 1; b < numColumnas; b++) {
                    //colspan="2"
                    if (carrera.equals(Reporte.get(b).getCarrera())) {
                        if (semestre == Integer.parseInt(Reporte.get(b).getSemestre())) {

                            nombres = Reporte.get(b).getMatricula() + " " + Reporte.get(b).getAP_Paterno() + " " + Reporte.get(b).getAP_Materno() + " " + Reporte.get(b).getNombre() + " ";
                            contenido = contenido + nombres + cadena.substring(0, cadena.length() - nombres.length()) + " " + Reporte.get(b).getHE() + "  " + (Integer.parseInt(Reporte.get(b).getHA()) - horas_restantes) + "\n";

                            //contenido = contenido + Reporte.get(b).getMatricula();
                        } else {
                            semestre = Integer.parseInt(Reporte.get(b).getSemestre());

                            contenido = contenido + "\n \n" + "                   				" + semestre + "      " + carrera + "\n";

                            nombres = Reporte.get(b).getMatricula() + "    " + Reporte.get(b).getAP_Paterno() + " " + Reporte.get(b).getAP_Materno() + " " + Reporte.get(b).getNombre() + " ";
                            contenido = contenido + nombres + cadena.substring(0, cadena.length() - nombres.length()) + " " + Reporte.get(b).getHE() + "  " + (Integer.parseInt(Reporte.get(b).getHA()) - horas_restantes) + "\n";

                        }

                    } else {
                        carrera = Reporte.get(b).getCarrera();
                        semestre = Integer.parseInt(Reporte.get(b).getSemestre());

                        contenido = contenido + "\n \n" + "                   				" + semestre + "      " + carrera + "\n";

                        nombres = Reporte.get(b).getMatricula() + "    " + Reporte.get(b).getAP_Paterno() + " " + Reporte.get(b).getAP_Materno() + " " + Reporte.get(b).getNombre() + " ";
                        contenido = contenido + nombres + cadena.substring(0, cadena.length() - nombres.length()) + " " + Reporte.get(b).getHE() + "  " + (Integer.parseInt(Reporte.get(b).getHA()) - horas_restantes) + "\n";

                    }

                }

                String tituloDocumento = "Reporte de horas";
                

                //Creamos el documento
                XWPFDocument documento = new XWPFDocument();

                //Declaramos el titulo y le asignamos algunas propiedades
                XWPFParagraph titulo_doc = documento.createParagraph();
                titulo_doc.setAlignment(ParagraphAlignment.CENTER);
                titulo_doc.setVerticalAlignment(TextAlignment.TOP);

                //Declaramos el parrafo y le asignamos algunas propiedades
                XWPFParagraph parrafo = documento.createParagraph();
                parrafo.setAlignment(ParagraphAlignment.BOTH);

                //Para el titulo
                XWPFRun r1 = titulo_doc.createRun();
                r1.setBold(true);
                //r1.setText(tituloDocumento);
                r1.setFontFamily("Arial");
                r1.setFontSize(14);
                r1.setTextPosition(10);
                r1.setUnderline(UnderlinePatterns.SINGLE);

                //Para el parrafo
                XWPFRun r2 = parrafo.createRun();
                r2.setText(contenido);
                r2.setFontSize(12);
                r2.addCarriageReturn();

                try {
                    String desktopPath = System.getProperty("user.home") + "\\Desktop\\";

                    FileOutputStream word = new FileOutputStream(desktopPath + tituloDocumento + ".docx");

                    File file = new File(desktopPath + tituloDocumento + ".docx");

                    if (!file.exists()) {
                        documento.write(word);
                        word.close();
                    } else {
                        file.delete();
                        documento.write(word);
                        word.close();
                    }

                } catch (FileNotFoundException ex) {
                    ex.printStackTrace();
                } catch (IOException ex) {
                    ex.printStackTrace();
                }

                

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    } catch (Exception e) {
        System.out.println("------A problem occurred while connecting to the database.");
        System.out.println(e.toString());
    }


%>
<jsp:forward page="Alumno_Generar_Reporte.jsp"> 
    <jsp:param name="mensaje" value="Se genero el reporte correctamente" />
</jsp:forward>
<%
%>