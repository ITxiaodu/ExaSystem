package com.team.pojo;

import org.springframework.web.multipart.MultipartFile;

public class UploadFile {
	private String username;
	private MultipartFile file;
	
	public UploadFile(){
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
