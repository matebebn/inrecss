package com.sys.inrecss.controller;

import com.spire.pdf.*;
import com.spire.pdf.fields.PdfTextBoxField;
import com.spire.pdf.graphics.*;
import com.spire.pdf.grid.PdfGrid;
import com.spire.pdf.tables.PdfHeaderSource;
import com.spire.pdf.tables.PdfTable;
import com.sys.inrecss.dao.UserDao;
import com.sys.inrecss.model.Event;
import com.sys.inrecss.model.Member;
import com.sys.inrecss.model.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;



@Controller
public class InvoiceController {


    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/invoice")
    public ModelAndView show_invoice(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView mav = new ModelAndView("invoice");
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id_user");
        List<Event> eventList = userDao.listEvent(Integer.valueOf(id));
        mav.addObject("listContact", eventList);
        return mav;
    }



    @RequestMapping(value = "/getInvoice")
    public ModelAndView getInvoice(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("invoice");
        String id =  request.getParameter("id_ev");
        HttpSession session = request.getSession();
        String id_user = (String) session.getAttribute("id_user");
        Event event=userDao.get(Integer.parseInt(id));
        event.getNameEvent();
        List<Payment> paymentList = userDao.listPayments(Integer.valueOf(id));
        mav.addObject("paymentList", paymentList);
        List<Member> memberList = userDao.listPerson(Integer.valueOf(id));
        mav.addObject("memberList", memberList);
        List<Event> eventList = userDao.listEventPaid(Integer.valueOf(id_user));
        mav.addObject("listContact", eventList);
        session.setAttribute("get","selected");
        session.setAttribute("nameEvent",event.getNameEvent());
        return mav;
    }



    @RequestMapping(value = "/createInvoice",method = RequestMethod.POST)
    public void generateReport(HttpServletResponse response) throws Exception {

        PdfDocument doc = new PdfDocument();
        String heading = "INVOICE";
        PdfSolidBrush brush1 = new PdfSolidBrush(new PdfRGBColor(Color.BLUE));
        PdfSolidBrush brush2 = new PdfSolidBrush(new PdfRGBColor(Color.BLACK));
        PdfTrueTypeFont font= new PdfTrueTypeFont(new Font("Times New Roman",Font.PLAIN,20));
        //Set margins
        PdfUnitConvertor unitCvtr = new PdfUnitConvertor();
        PdfMargins margin = new PdfMargins();
        margin.setTop(unitCvtr.convertUnits(2.54f, PdfGraphicsUnit.Centimeter, PdfGraphicsUnit.Point));
        margin.setBottom(margin.getTop());
        margin.setLeft(unitCvtr.convertUnits(3.17f, PdfGraphicsUnit.Centimeter, PdfGraphicsUnit.Point));
        margin.setRight(margin.getLeft());
        //Add one page
        PdfPageBase page = doc.getPages().add(PdfPageSize.A4, margin);
        float y = 10;
        //Draw title
        PdfTrueTypeFont font1 = new PdfTrueTypeFont(new Font("Arial",Font.BOLD ,16));
        PdfStringFormat format1 = new PdfStringFormat(PdfTextAlignment.Center);
        page.getCanvas().drawString("Country List", font1, brush1, page.getCanvas().getClientSize().getWidth() / 2, y, format1);
        y = y + (float) font1.measureString("Country List", format1).getHeight();
        y = y + 5;
        //Data source to create table
        String[] data1 = {"Name;Capital;Continent;Area;Population", "Argentina;Buenos Aires;South America;2777815;32300003", "Bolivia;La Paz;South America;1098575;7300000", "Brazil;Brasilia;South America;8511196;150400000", "Canada;Ottawa;North America;9976147;26500000", "Chile;Santiago;South America;756943;13200000", "Colombia;Bagota;South America;1138907;33000000", "Cuba;Havana;North America;114524;10600000", "Ecuador;Quito;South America;455502;10600000", "El Salvador;San Salvador;North America;20865;5300000", "Guyana;Georgetown;South America;214969;800000", "Jamaica;Kingston;North America;11424;2500000", "Mexico;Mexico City;North America;1967180;88600000", "Nicaragua;Managua;North America;139000;3900000", "Paraguay;Asuncion;South America;406576;4660000", "Peru;Lima;South America;1285215;21600000", "United States of America;Washington;North America;9363130;249200000", "Uruguay;Montevideo;South America;176140;3002000", "Venezuela;Caracas;South America;912047;19700000"};

        String[][] dataSource = new String[data1.length][];
        for (int i = 0; i < data1.length; i++) {
            dataSource[i] = data1[i].split("[;]", -1);
        }

        //Create a PdfTable instance and set data source
        PdfTable table = new PdfTable();
        table.getStyle().setCellPadding(2);
        table.getStyle().setHeaderSource(PdfHeaderSource.Rows);
        table.getStyle().setHeaderRowCount(1);
        table.getStyle().setShowHeader(true);
        table.setDataSource(dataSource);
        //Draw table to the page
        PdfLayoutResult result = table.draw(page, new Point2D.Float(0, y));
        y = y + (float) result.getBounds().getHeight() + 5;
        //Draw string below table
        PdfTrueTypeFont font2 = new PdfTrueTypeFont(new Font("Arial", 0,9));
        page.getCanvas().drawString(String.format("* %1$s countries in the list.", data1.length - 1), font2, brush2, 5, y);
        PdfStringFormat leftAlignment = new PdfStringFormat(PdfTextAlignment.Left);
        PdfImage image = PdfImage.fromFile("C:\\Users\\Mateusz\\Desktop\\Praca Inżynierska\\Program\\src\\main\\webapp\\resources\\img\\logo.png");
        float width = image.getWidth() * 0.55f;
        float height = image.getHeight() * 0.55f;
        double x = (page.getCanvas().getClientSize().getWidth()) / 2 ;
        page.getCanvas().drawImage(image, x, y, width, height);
        page.getCanvas().drawString(heading, font , brush2, 0, 20, leftAlignment);
        doc.saveToFile("C:\\Users\\Mateusz\\Desktop\\Praca Inżynierska\\Program\\src\\main\\webapp\\resources\\invoice\\xdd.pdf");
        byte[] data = Files.readAllBytes(Paths.get("C:\\Users\\Mateusz\\Desktop\\Praca Inżynierska\\Program\\src\\main\\webapp\\resources\\invoice/xdd.pdf"));
        streamReport(response, data, "my_report.pdf");
    }

    protected void streamReport(HttpServletResponse response, byte[] data, String name)
            throws IOException {

        response.setContentType("application/pdf");
        response.setHeader("Content-disposition", "attachment; filename=" + name);
        response.setContentLength(data.length);

        response.getOutputStream().write(data);
        response.getOutputStream().flush();
    }


}
