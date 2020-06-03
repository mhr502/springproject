package sam08;

import java.io.File;
import java.io.FileWriter;

public class FileOutputter implements Outputter {
	//c:/log/msg1.txt
	private String fileName;
	
	public void setFileName(String fileName) {
		this.fileName =fileName;
	}
	public void output(String msg) {
		try {
			System.out.println("fileName:" + fileName);
			FileWriter fw = new FileWriter(new File(fileName));
			fw.write(msg);
			fw.close();
		} catch (Exception e) {
				System.out.println(e.getMessage());
		}
	}
	

}
