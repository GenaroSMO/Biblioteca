package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Alumno_005fActualizar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\"  href=\"CSS/EstilosAlumnos.css\">\n");
      out.write("        <title>Actualizar Alumno</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");


            if (session.getAttribute("Usuario") == null) {
        
      out.write("\n");
      out.write("        ");
      if (true) {
        _jspx_page_context.forward("index.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("mensaje", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("Lo Sentimos, No han iniciado sesion ", request.getCharacterEncoding()));
        return;
      }
      out.write(" \n");
      out.write("        ");

            }

            String x = session.getAttribute("Usuario") + "";
            String cancelar = "";
            if (x.equals("0")) {
                cancelar = "Menu_Administrador.jsp";
            }

            if (x.equals("1")) {
                cancelar = "Menu_Usuario.jsp";
            }

            String mensaje = request.getParameter("mensaje");
            String visible = "display:none";
            String buscar = "display:inline";
            String editable = "";

            String matricula = request.getParameter("matricula");
            String nombre = request.getParameter("nombre");
            String appaterno = request.getParameter("ApPaterno");
            String apmaterno = request.getParameter("ApMaterno");
            String carrea = request.getParameter("Carrera");
            String semestre = request.getParameter("Semestre");
            String img = request.getParameter("IMG");

            String[] Semestre = {"<option >1</option> ", "<option >2</option> ", "<option >3</option> ", "<option >4</option> ", "<option >5</option> ", "<option >6</option> ", "<option >7</option> ", "<option >8</option>" , "<option >9</option> ", "<option >10</option>"};

            String[] Carrera = {"<option >Acuicultura</option> ", "<option >Agricola</option>", "<option >Computacion</option> ", "<option >Diseno</option> ", "<option >Matematicas</option> ", "<option >Mecatronica</option> ", "<option >Zootecnia</option> "};

            if (mensaje == null) {
                mensaje = "";
                matricula = "";
                nombre = "";
                appaterno = "";
                apmaterno = "";
                carrea = "";
                semestre = "";
                img = "img/user2.png";
            } else {
                if (mensaje.equals("1")) {
                    System.out.println("REGRESO BIEN");
                    buscar = "display:none";
                    visible = "display:inline";
                    editable = "readonly=" + "readonly " + " ";
                    mensaje = "";
                    // System.out.println("Esta a punto de entrar a los if de carerra");
                    if (carrea.equals("Acuicultura")) {
                        Carrera[0] = "<option selected>Acuicultura</option>";
                    }
                    if (carrea.equals("Agricola")) {
                        Carrera[1] = "<option selected>Agricola</option>";
                    }
                    if (carrea.equals("Computacion")) {
                        Carrera[2] = "<option selected>Computacion</option>";
                    }
                    if (carrea.equals("Diseno")) {
                        Carrera[3] = "<option selected>Diseno</option>";
                    }
                    if (carrea.equals("Matematicas")) {
                        Carrera[4] = "<option selected>Matematicas</option>";
                    }
                    if (carrea.equals("Mecatronica")) {
                        Carrera[5] = "<option selected>Mecatronica</option>";
                    }
                    if (carrea.equals("Zootecnia")) {
                        Carrera[6] = "<option selected>Zootecnia</option>";
                    }

                    System.out.println("Esta a punto de entrar a los if de carerra");
                    if (semestre.equals("1")) {
                        Semestre[0] = "<option selected>1</option>";
                    }
                    if (semestre.equals("2")) {
                        Semestre[1] = "<option selected>2</option>";
                    }
                    if (semestre.equals("3")) {
                        Semestre[2] = "<option selected>3</option>";
                    }
                    if (semestre.equals("4")) {
                        Semestre[3] = "<option selected>4</option>";
                    }
                    if (semestre.equals("5")) {
                        Semestre[4] = "<option selected>5</option>";
                    }
                    if (semestre.equals("6")) {
                        Semestre[5] = "<option selected>6</option>";
                    }
                    if (semestre.equals("7")) {
                        Semestre[6] = "<option selected>7</option>";
                    }
                    if (semestre.equals("8")) {
                        Semestre[7] = "<option selected>8</option>";
                    }
                    if (semestre.equals("9")) {
                        Semestre[8] = "<option selected>9</option>";
                    }
                    if (semestre.equals("10")) {
                        Semestre[9] = "<option selected>10</option>";
                    }

                }

                if (mensaje.equals("2")) {
                    editable = "";
                    System.out.println("REGRESO BIEN x 2");
                    buscar = "display:inline";
                    visible = "display:none";
                    mensaje = "Alumno Actualizado";
                    matricula = "";
                    nombre = "";
                    appaterno = "";
                    apmaterno = "";
                    carrea = "";
                    semestre = "";
                    img = "img/user2.png";

                }

                if (mensaje.equals("3")) {
                    mensaje = "El Alumno No Existe ";
                    matricula = "";
                    nombre = "";
                    appaterno = "";
                    apmaterno = "";
                    carrea = "";
                    semestre = "";
                    img = "img/user2.png";
                }
                if (mensaje.equals("4")) {
                    mensaje = "La matricula excede el tamaño de 8";
                    matricula = "";
                    nombre = "";
                    appaterno = "";
                    apmaterno = "";
                    carrea = "";
                    semestre = "";
                    img = "img/user2.png";

                }

            }

        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form action=\"Control_Alumno_Actualizar.jsp\"  method=\"post\" class=\"FormActualizar\"> \n");
      out.write("            <label for=\"txtUsuario\" class=\"AgregarAlumno\">Actualizar Alumno </label>\n");
      out.write("            <br>\n");
      out.write("\n");
      out.write("            <table border=\"0\">\n");
      out.write("\n");
      out.write("                <tr  >\n");
      out.write("                    <td rowspan=\"7\" WIDTH=\"20\" HEIGHT=\"250\"> </td>\n");
      out.write("                    <td rowspan=\"6\" WIDTH=\"200\" height=\"240\" >  <img src=\"");
      out.print(img);
      out.write("\" width=\"190\" height=\"230\"/> </td>\n");
      out.write("                    <td class=\"texto\"  height=\"20\">Matricula: </td>\n");
      out.write("                    <td><input ");
out.print(editable);
      out.write(" type=\"text\"   name=\"txtMatricula\" value=\"");
      out.print(matricula);
      out.write("\" placeholder=\"Matricula\" required=\"\" class=\"caja\"></td>\n");
      out.write("                    <td  WIDTH=\"50\" HEIGHT=\"20\" ><input  align=\"center\" style=\"");
      out.print(buscar);
      out.write("\" type=\"submit\" name=\"Buscar\" value=\"Buscar\" class=\"boton\">  </td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"texto\" height=\"20\"> Nombre: </td>\n");
      out.write("                    <td WIDTH=\"220\" ><input type=\"text\" name=\"txtNombre\" value=\"");
      out.print(nombre);
      out.write("\" id=\"\" placeholder=\"Nombre\"  class=\"caja\"></td>\n");
      out.write("                    <td  WIDTH=\"50\" HEIGHT=\"20\" > <input style=\"display:none\" type=\"text\" name=\"imagen\" value=\"");
      out.print(img);
      out.write("\" > </td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"texto\" height=\"20\">Ap Paterno: </td>\n");
      out.write("                    <td  ><input type=\"text\" name=\"txtApPaterno\" id=\"\" value=\"");
      out.print(appaterno);
      out.write("\" placeholder=\"Apellido Paterno\"  class=\"caja\"></td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"texto\" height=\"20\">Ap Materno: </td>\n");
      out.write("                    <td WIDTH=\"220\" ><input type=\"text\" name=\"txtApMaterno\" id=\"\" value=\"");
      out.print(apmaterno);
      out.write("\" placeholder=\"Apellido Materno\"  class=\"caja\"></td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"texto\" height=\"20\" >Semestre: </td>\n");
      out.write("                    <td><select name=\"JopSemestre\" class=\"caja\" >\n");
      out.write("                            ");

                                out.print(Semestre[0]);
                                out.print(Semestre[1]);
                                out.print(Semestre[2]);
                                out.print(Semestre[3]);
                                out.print(Semestre[4]);
                                out.print(Semestre[5]);
                                out.print(Semestre[6]);
                                out.print(Semestre[7]);
                                out.print(Semestre[8]);
                                out.print(Semestre[9]);
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("\n");
      out.write("                    <td class=\"texto\" height=\"20\" >Carrera: </td>\n");
      out.write("                    <td><select name=\"JopCarrera\"  class=\"caja\" >\n");
      out.write("                            ");

                                out.print(Carrera[0]);
                                out.print(Carrera[1]);
                                out.print(Carrera[2]);
                                out.print(Carrera[3]);
                                out.print(Carrera[4]);
                                out.print(Carrera[5]);
                                out.print(Carrera[6]);
                            
      out.write("\n");
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <table border=\"0\">\n");
      out.write("                <tr>\n");
      out.write("                    <td  WIDTH=\"20\"  HEIGHT=\"50\"> </td>\n");
      out.write("                    <td  WIDTH=\"200\" HEIGHT=\"50\" ></td>\n");
      out.write("                    <td  WIDTH=\"100\" HEIGHT=\"50\" ></td>\n");
      out.write("                    <td  WIDTH=\"100\" HEIGHT=\"50\" > <center> <a class=\"boton\" href=\"");
      out.print(cancelar);
      out.write("\">Regresar</a>   </center>  </td>\n");
      out.write("                <td  WIDTH=\"100\"  HEIGHT=\"50\" > <input align=\"center\" style=\"");
      out.print(visible);
      out.write("\" type=\"submit\" name=\"Actualizar\" value=\"Actualizar\" class=\"boton\">  </td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <table  border=\"0\">\n");
      out.write("                <tr>\n");
      out.write("\n");
      out.write("                    <td  WIDTH=\"640\" HEIGHT=\"20\" class=\"texto\"> <b><center> ");
      out.print( mensaje);
      out.write("   </center> </b></td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
