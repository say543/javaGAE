package spring.model;




import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author Chieh-Chun Chang
 *
 */
//  in MySQL, cappitalize and uncaptilized have no difference
//  in JAVA Servelet, class always capilalized
@Entity
@Table(name="RECORD")  // capitalize paying attention
public class Record {
	
	// unallowed in Spring
	//private final double DOUBLEDEFAULT = 3000.0;
	//private final String DATEDEFAULT = "1999-01-01";
	
	 @Id
	 @Column(name="id")
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 private String id;
	     
	 private String name;
	 private String rsnum;
	 private String drivedate;
	 private String drivescan;
	 //private double temp;
	 //private double volts;
	 private String temp;
	 private String volts;
	 private String previmage;
	 private String tft;
	 private String waveformname;
	 private String samplecondi;
	 //private boolean barcodescan;
	 private String barcodescan;
	 private String notes;
	 private String link;
	 
	 public String getId() {
	    return id;
	 }
	 public void setId(String id) {
	    this.id = id;
	 }
	 
	 public String getName() {
	    return name;
	 }
	 public void setName(String name) {
	    this.name = name;
	 }
	 public String getRsnum() {
		    return rsnum;
	 }
	 public void setRsnum(String rsnum) {
		 this.rsnum = rsnum;
	 }
	 
	 
	 
	 public String getDrivedate() {
		    return drivedate;
	 }
		 
	 public void setDrivedate(String drivedate) {
	    this.drivedate = drivedate;
	 }
	 
	 public String getDrivescan() {
		    return drivescan;
	 }	 
	 public void setDrivescan(String drivescan) {
	    this.drivescan = drivescan;
	 }
	 
	 /*public double getTemp() {
		    return temp;
	 }*/
	 public String getTemp() {
		//if (temp == (double)3000.0)
		//	return "";
		return temp; 
	 }
	 
	 
	 public void setTemp(double temp) {
		    this.temp = String.valueOf(temp);
	 }
	 
	 /*public double getVolts() {
		    return volts;
	 }*/
	 public String getVolts() {
		 //if (volts == (double)DOUBLEDEFAULT)
		//		return "";
		 	return volts;
	 }
	 
	 
	 public void setVolts(double volts) {
		    this.volts =  String.valueOf(volts);
	 }
	 
	 public String getPrevimage() {
		    return previmage;
	 }
	 public void setPrevimage(String previmage) {
		 this.previmage = previmage;
	 }
	 
	 public String getTft() {
		    return tft;
	 }
	 public void setTft(String tft) {
		    this.tft = tft;
	 }
	 
	 public String getWaveformname() {
		    return waveformname;
	 }
	 public void setWaveformname(String waveformname) {
		    this.waveformname = waveformname;
	 }
	 
	 public String getSamplecondi() {
		    return samplecondi;
	 }
	 public void setSamplecondi(String samplecondi) {
		    this.samplecondi = samplecondi;
	 }

	 
	 /*public boolean getBarcodescan() {
		    return barcodescan;
	 }*/
	 public String getBarcodescan() {
	    return barcodescan;
	 }
	 
	 
	 
	 public void setBarcodescan(boolean barcodescan) {
		 	if (barcodescan)
		 		this.barcodescan = "true";
		 	else
		 		this.barcodescan = "false";
	 }
	 
	 public String getNotes() {
		    return notes;
	 }
	 public void setNotes(String notes) {
		    this.notes = notes;
	 }	 
	 
	 public String getLink() {
		    return link;
	 }
	 public void setLink(String link) {
		    this.link = link;
	 }
	 
	 @Override
	    public String toString(){
	        return "id="+id+", name="+name+", rsnum="+rsnum+",drivedate="+drivedate+", drivescan="+drivescan+", temp="+temp+", volts="+volts+
	        		", previmage="+previmage+", tft="+tft+", waveformname="+waveformname+", samplecondi="+samplecondi+", barcodescan="+barcodescan+
	        		", notes="+notes+", link="+link;
	    }
	 
}
