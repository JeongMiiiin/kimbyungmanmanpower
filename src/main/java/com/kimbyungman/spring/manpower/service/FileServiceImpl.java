package com.kimbyungman.spring.manpower.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Base64;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.kimbyungman.spring.manpower.dao.FileDao;

@Service
public class FileServiceImpl extends RootService implements FileService {
	
	@Autowired
	private FileDao dao;
	
	//로컬 설정
	
	 private static final String SAVE_IMG_PATH = "C:\\Users\\JEONG MIN\\eclipse-workspace\\kimbyungmanmanpower\\src\\main\\webapp\\uploadFile";
	 private static final String SAVE_TXT_PATH = "C:\\Users\\JEONG MIN\\eclipse-workspace\\kimbyungmanmanpower\\src\\main\\webapp\\chattingFile";
	
	//개발 서버 설정
	
	/*
	 * private static final String SAVE_IMG_PATH =
	 * "/cnj0012/tomcat/webapps/uploadFile/img"; private static final String
	 * SAVE_TXT_PATH = "/cnj0012/tomcat/webapps/uploadFile/txt";
	 */
	
	//실서버 설정
	/*
	 * private static final String SAVE_IMG_PATH =
	 * "/usr/local/apache-tomcat-8.5.83/webapps/uploadFile/img"; private static
	 * final String SAVE_TXT_PATH =
	 * "/usr/local/apache-tomcat-8.5.83/webapps/uploadFile/txt";
	 */
	 
	 
	//파일 업로드 (공통)
	@Override
	public int fileUpload( MultipartFile mf) {
		
		String originalFileName = mf.getOriginalFilename();
		
		int extIndex = originalFileName.lastIndexOf("."); 
		
		String fileName = originalFileName.substring(0, extIndex);
		
		String fileExt = originalFileName.substring(extIndex + 1);
        
        UUID randomeUUID = UUID.randomUUID();
        
        String saveFile = System.currentTimeMillis() + String.valueOf(randomeUUID) + "." + fileExt;

        try {
            mf.transferTo(new File(SAVE_IMG_PATH, saveFile));
            
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
                // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        HashMap<String, Object> fileInfo = new HashMap<String, Object>();
        fileInfo.put("fileName", saveFile);
        fileInfo.put("originFileName", fileName);
        fileInfo.put("ext", fileExt);
        
        int result = dao.insertFile(fileInfo);
        
        return result;
	}
	
	//base64파일 업로드 (공통)
	@Override
	public int fileUploadBase64(String base64) {
		FileOutputStream fos;
		String data = base64.split(",")[1];
		byte[] imageBytes = Base64.getDecoder().decode(data);
		
		UUID randomeUUID = UUID.randomUUID();
		
		String fileName = System.currentTimeMillis() + String.valueOf(randomeUUID) + "." + "png";
		
		String fileDirectory = SAVE_IMG_PATH + "/" + System.currentTimeMillis() + String.valueOf(randomeUUID) + "." + "png";
		File target = new File(fileDirectory);
		try {
			target.createNewFile();
			fos = new FileOutputStream(target);
			fos.write(imageBytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HashMap<String, Object> fileInfo = new HashMap<String, Object>();
        fileInfo.put("fileName", fileName);
        fileInfo.put("originFileName", fileName);
        fileInfo.put("ext", "png");
        
        int result = dao.insertFile(fileInfo);
        
        return result;
		
	}
	
	//파일 이름 데이터 조회 (공통)
	@Override
	public String[] getFileName(int fileSeq) {return dao.getFileName(fileSeq);};
	
	//파일 다운로드 (공통)
	@Override
	public void download(int fileSeq, HttpServletResponse response) {
		String[] fileNameList = getFileName(fileSeq);
		File f = new File(SAVE_IMG_PATH, fileNameList[0]);
		if(!f.isFile()){
			/* throw new BizNotFoundException("해당 첨부파일이 존재하지 않습니다."); */
		}
		// 다운로드를 위한 헤더 생성
		response.setHeader("Content-Type", "application/octet-stream;");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + fileNameList[1] + "." + fileNameList[2] + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setContentLength((int) f.length()); // 진행율
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		// 저장된 파일을 응답객체의 스트림으로 내보내기,  resp의 outputStream에  해당파일을 복사
		try {
			FileUtils.copyFile(f, response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	};
	
	//파일 보여주기 (공통)
	@Override
	public ResponseEntity<byte[]> display(int fileSeq){
		String[] fileNameList = getFileName(fileSeq); 
		File file=new File(SAVE_IMG_PATH,fileNameList[0]);
	    ResponseEntity<byte[]> result=null;
	    try {
	        HttpHeaders headers=new HttpHeaders();
	        headers.add("Content-Type", Files.probeContentType(file.toPath()));
	        result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK );
	    }catch (IOException e) {
	        e.printStackTrace();
	    }
	    return result;
	};
	
	//파일 삭제 (공통)
	@Override
	public void delete(int fileSeq) {
		String[] fileNameList = getFileName(fileSeq); 
		File file=new File(SAVE_IMG_PATH,fileNameList[0]);
		
		if(file.exists()) {
			if(file.isDirectory()){ //파일이 디렉토리인지 확인
    			
    			File[] files = file.listFiles();
    			
    			for( int i=0; i<files.length; i++){
    				if( files[i].delete() ){
    					System.out.println(files[i].getName()+" 삭제성공");
    				}else{
    					System.out.println(files[i].getName()+" 삭제실패");
    				}
    			}
    			
    		}
    		if(file.delete()){
    			dao.delete(fileSeq);
    		}else{
    			System.out.println("파일삭제 실패");
    		}
		}
	}
	
	//채팅 파일 생성 (공통)
	@Override
	public int createChatTxt() {
		
		int result = 0;
		UUID randomeUUID = UUID.randomUUID();
		
		String fileName = System.currentTimeMillis() + String.valueOf(randomeUUID) + "." + "txt";
		
		File txtFile = new File(SAVE_TXT_PATH + "/" + fileName);
		
		try {
            if(txtFile.createNewFile()) {
            	HashMap<String, Object> fileInfo = new HashMap<String, Object>();
                fileInfo.put("fileName", fileName);
                fileInfo.put("originFileName", fileName);
                fileInfo.put("ext", "txt");
                
                result = dao.insertFile(fileInfo);
            } else {
            	result = -1;
            }

        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
                // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return result;
		
		
	};
	
	//채팅 파일 읽기 (공통)
	@Override
	public String readChatTxt(int fileSeq) {
		String fileName = dao.getFileName(fileSeq)[0];
		
		File txtFile = new File(SAVE_TXT_PATH + "/" + fileName);
		
		if(!txtFile.exists()) {
			return "";
		}
		
		try (FileInputStream stream = new FileInputStream(txtFile)) {
			return new String(IOUtils.toString(stream, StandardCharsets.UTF_8.name()));
		} catch (Throwable e) {
			e.printStackTrace();
			return "";
		}
		
	};
	
	//채팅 내용 저장 (공통)
	@Override
	public void saveChatText(int fileSeq, int userSn, String name, String sendDate, String message) {
		String fileName = dao.getFileName(fileSeq)[0];
		
		// 메시지 내용
		String msg = sendDate + " time, " + userSn + " " + name + ") " + message + "\n";
		// 파일을 저장한다.
		try (FileOutputStream stream = new FileOutputStream(SAVE_TXT_PATH + "/" + fileName, true)) {
			stream.write(msg.getBytes("UTF-8"));
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
	};
	
}
