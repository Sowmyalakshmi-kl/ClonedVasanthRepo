package com.ynr.prd.viewer.reportView;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.ynr.prd.viewer.model.User;

public class UserPDFView extends AbstractPdfView{

	public static ByteArrayInputStream generateReport(List<User> users) {

		Document document = new Document();
		ByteArrayOutputStream out = new ByteArrayOutputStream();

		try {

			PdfPTable table = new PdfPTable(3);
			table.setWidthPercentage(60);
			table.setWidths(new int[] { 1, 3, 3 });

			Font headFont = FontFactory.getFont(FontFactory.COURIER);

			PdfPCell hcell;
			hcell = new PdfPCell(new Phrase("Id", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Name", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Email", headFont));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			for (User user : users) {

				PdfPCell cell;

				cell = new PdfPCell(new Phrase(user.getCreatedBy()));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(user.getName()));
				cell.setPaddingLeft(5);
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(user.getEmail()));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				cell.setPaddingRight(5);
				table.addCell(cell);
			}

			PdfWriter.getInstance(document, out);
			document.open();
			document.add(table);

			document.close();

		} catch (DocumentException ex) {

			ex.printStackTrace();
		}

		return new ByteArrayInputStream(out.toByteArray());
	}

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// change the file name
		response.setHeader("Content-Disposition", "attachment; filename=\"my-pdf-file.pdf\"");

		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) model.get("users");
		document.add(new Paragraph("Generated Users " + LocalDate.now()));

		PdfPTable table = new PdfPTable(users.stream().findAny().get().getColumnCount());
		table.setWidthPercentage(100.0f);
		table.setSpacingBefore(10);

		// define font for table header row
		Font font = FontFactory.getFont(FontFactory.TIMES);
		font.setColor(BaseColor.WHITE);

		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.DARK_GRAY);
		cell.setPadding(5);

		// write table header
		cell.setPhrase(new Phrase("First Name", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("Last Name", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("E mail", font));
		table.addCell(cell);

		for (User user : users) {
			table.addCell(user.getName());
			table.addCell(user.getLastName());
			table.addCell(user.getEmail());
		}

		document.add(table);
		
	}
}
