package com.et.edusoho.tools;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
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
	
	public static String save(final MultipartFile uploadFile,String fileName) {
		if (uploadFile != null) {
			try {
				
				File file = new File(fileName);
				
				String parentDir = file.getParent();
				
				File dir = new File(parentDir);
				
				if (!dir.exists()) {
					dir.mkdirs();
				}
				
				return transferToFile(uploadFile, file);
				
			} catch (IllegalStateException e) {
				logger.warn("保存文件出现错误!", e);
			} catch (IOException e) {
				logger.warn("保存文件出现错误!", e);
			} 
		}
		
		return "";
	}
	
	@SuppressWarnings("resource")
	public static String save(final byte[] bytes,String parentDir, String newFileName) {
		if (bytes != null) {
			try {
				
				File dir = new File(parentDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}
				
				File file = new File(parentDir + newFileName);
				if (!file.exists()) {
					file.createNewFile();
				}
				
				new FileOutputStream(file).write(bytes);
				
				return file.getName();
				
			} catch (IllegalStateException e) {
				logger.warn("保存文件出现错误!", e);
			} catch (IOException e) {
				e.printStackTrace();
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
		
		String suffixName = "";
		
		if (fileName != null) {
			int beginIndex = fileName.lastIndexOf(".");
			
			if (beginIndex > 0) {
				suffixName = fileName.substring(beginIndex + 1);
			}
			
			if (suffixName.contains("?")) {
				int endIndex = suffixName.indexOf("?");
				if (endIndex > 0) {
					suffixName = suffixName.substring(0, endIndex);
				}
			}
		}

		return suffixName;
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
	
	public static List<String> findLessonImage(String types){
		
		List<String> list = new ArrayList<String>();
		String[] fileTypes = types.split(",");
		
		String LESSON_IMAGE_DIR =  PathUtil.getPath() + CONSTANTCONTEXT.LESSON_FILE_DIR;
		
		File dirs = new File(LESSON_IMAGE_DIR);
		
		File[] files = dirs.listFiles();
		
		if (files == null) {
			return list;
		}
		
		
		for(File file : files){
			
			if (file == null) {
				continue;
			}
			
			String fileType = getFileExtension(file.getName()).toLowerCase();
			
			for(String type : fileTypes){
				if (StringUtils.isEmpty(type)) {
					continue;
				}
				
				if (type.equals(fileType)) {
					list.add(file.getName());
					break;
				}
			}
		}
		
		return list;
	}
}
