package com.sting.service;

import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class SignupService {
	
	private FileOutputStream fos;
	public void makeimageFile(MultipartFile file,String filename,String path){
		try {
			byte fileData[] = file.getBytes();
			int pathPoint = file.getOriginalFilename().trim().lastIndexOf(".");
			String filePoint = file.getOriginalFilename().trim().substring(pathPoint + 1,
					file.getOriginalFilename().trim().length());
			String fileType = filePoint.toLowerCase();
//			fos = new FileOutputStream("../sting\\src\\main\\webapp\\resource\\uploadimgs\\"+path+filename+ "." + fileType);
			fos = new FileOutputStream("../sting\\src\\main\\webapp\\resources\\uploadimgs\\"+path+filename+ "." + fileType);

			fos.write(fileData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		} // try end;
	}
}
