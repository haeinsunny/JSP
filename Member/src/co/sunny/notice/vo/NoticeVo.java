package co.sunny.notice.vo;

import java.sql.Date;

public class NoticeVo {
	private int nId;
	private String nWriter;	
	private String nTitle;	
	private String nContent;	
	private int nHit;	
	private String nAttach;
	
	public String getnAttach() {
		return nAttach;
	}

	public void setnAttach(String nAttach) {
		this.nAttach = nAttach;
	}

	private Date nDate;
	
	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public int getnHit() {
		return nHit;
	}

	public void setnHit(int nHit) {
		this.nHit = nHit;
	}
	


	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public NoticeVo() {
		
	}
	
}
