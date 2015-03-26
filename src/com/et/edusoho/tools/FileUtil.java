package com.et.edusoho.tools;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public abstract class FileUtil {
	
	private static Logger logger = Logger.getLogger(FileUtil.class);
	
	private static SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");

	public static String save(final MultipartFile uploadFile,String parentDir, String newFileName) {
		if (uploadFile != null) {
			try {
				
				File dir = new File(parentDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				
				String fileExtension = getFileExtension(uploadFile.getOriginalFilename());
				
				File file = new File(parentDir + newFileName + "." + fileExtension);
				
				return transferToFile(uploadFile, file);
				
			} catch (IllegalStateException e) {
				logger.warn("保存文件出现错误!", e);
			} catch (IOException e) {
				logger.warn("保存文件出现错误!", e);
			} 
		}
		
		return "";
	}

	private static String transferToFile(final MultipartFile uploadFile,
			File file) throws IOException {
		
		if (!file.exists()) {
			file.createNewFile();
		}
		uploadFile.transferTo(file);
		
		return file.getName();
	}
	
	public static String getFileNameTime(){
		Date date = new Date();
		return format.format(date);
	}

	public static String getFileExtension(String fileName) {
		if (fileName != null) {
			int beginIndex = fileName.lastIndexOf(".");
			if (beginIndex > 0) {
				return fileName.substring(beginIndex + 1);
			}
		}

		return "tmp";
	}

	public static void download(HttpServletResponse response, String fileName) {
		
		writeToResponse(response,fileName,new File(fileName));
	}
	
	private static byte[] getFileData(File newFile) {
		try {
			return FileUtils.readFileToByteArray(newFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new byte[0];
	}
	
	
	private static void writeToResponse(HttpServletResponse response,
			String clientName, File file) {
		
		byte[]data = getFileData(file);
		
		response.reset();  
		
		try {
			clientName = new String(clientName.getBytes("UTF-8"), "ISO-8859-1");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + clientName + "\"");  
		response.addHeader("Content-Length", "" + data.length);  
		response.setContentType("application/octet-stream;charset=UTF-8");  
		
		OutputStream outputStream = null;
		try {
			outputStream = new BufferedOutputStream(response.getOutputStream());  
			outputStream.write(data);
		} catch (IOException e) {
			e.printStackTrace();
		}  finally{
			try {
				outputStream.close();  
				outputStream.flush();  
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
