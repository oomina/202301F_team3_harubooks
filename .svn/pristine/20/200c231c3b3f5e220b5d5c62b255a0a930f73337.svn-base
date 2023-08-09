package kr.or.ddit.controller.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.FileVO;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws IOException {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + originalName;	// 저장 이름 : uuid_원본파일 이름
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);	// 확장자
		
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		String uploadedFileName = uploadPath + "/" + savedName;
		
		if(MediaUtils.getMediaType(formatName) != null) {
			makeThumbnail(uploadPath, savedName);
		}
		return uploadedFileName;
	}

	private static void makeThumbnail(String uploadPath, String fileName) throws IOException {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath, fileName));
		
		// Method.AUTOMATIC : 최소 시간 내에 가장 잘 보이는 이미지를 얻기 위한 사용 방식
		// Mode.FIT_TO_HEIGHT : 이미지 방향과 상관없이 주어진 높이 내에서 가장 잘 맞는 이미지로 계산 (높이 위주)
		// targetSize : 값 100, 정사각형 사이즈로 100x100
		BufferedImage destImg= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 1000);
		// 업로드 한 원본 이미지를 가지고 's_'를 붙여서 임시 파일로 만든다. 
		String thumbnailName = uploadPath+ File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);	// 's_'가 붙은 썸네일 이미지를 만든다. 
	}
	
	
	// 모든 이미지 파일들
	public static List<FileVO> uploadFile(String uploadPath, String uaType, List<MultipartFile> imgFile) throws IOException {
		List<FileVO> imgFileNm = new ArrayList<>();
		UUID uuid = UUID.randomUUID();
		for(int i = 0; i < imgFile.size(); i++) {
			FileVO tempFileNm = new FileVO();
			
			String originalName = imgFile.get(i).getOriginalFilename();
			String savedName = uuid.toString() + "_" + originalName;	// 저장 이름 : uuid_원본파일 이름
			
			String formatName = originalName.substring(originalName.lastIndexOf(".")+1);	// 확장자
			
			File target = new File(uploadPath, savedName);
			FileCopyUtils.copy(imgFile.get(i).getBytes(), target);
			String uploadedFileName = uploadPath + "/" + savedName;
			
			tempFileNm.setUa_path(uploadedFileName);
			tempFileNm.setUa_sn((i+1)+"");
			tempFileNm.setUa_type(uaType);
			tempFileNm.setUa_nm(originalName);
			tempFileNm.setUa_stre_nm(savedName);
			tempFileNm.setUa_file_type(formatName);
			tempFileNm.setUa_size(imgFile.get(i).getSize());
			
			if(MediaUtils.getMediaType(formatName) != null) {
				makeThumbnail(uploadPath, savedName);
			}
			imgFileNm.add(tempFileNm);
		}
		return imgFileNm;

	}
	
	// 필터가 적용된 이미지 파일들
	public static List<FileVO> uploadFile(String uploadPath, List<MultipartFile> imgFile, String uaType, List<String> filters) throws IOException {
		List<FileVO> imgFileNm = new ArrayList<>();
		UUID uuid = UUID.randomUUID();
		for(int i = 0; i < imgFile.size(); i++) {
			FileVO tempFileNm = new FileVO();
			
			String originalName = imgFile.get(i).getOriginalFilename();
			String savedName = uuid.toString() + "_" + originalName;	// 저장 이름 : uuid_원본파일 이름
			
			String formatName = originalName.substring(originalName.lastIndexOf(".")+1);	// 확장자
			
			File target = new File(uploadPath, savedName);
			FileCopyUtils.copy(imgFile.get(i).getBytes(), target);
			String uploadedFileName = uploadPath + "/" + savedName;
			
			tempFileNm.setUa_path(uploadedFileName);
			tempFileNm.setUa_sn((i+1)+"");
			tempFileNm.setUa_type(uaType);
			tempFileNm.setUa_nm(originalName);
			tempFileNm.setUa_stre_nm(savedName);
			tempFileNm.setUa_file_type(formatName);
			tempFileNm.setUa_size(imgFile.get(i).getSize());
			tempFileNm.setUa_etc(filters.get(i));
			
			if(MediaUtils.getMediaType(formatName) != null) {
				makeThumbnail(uploadPath, savedName);
			}
			
			imgFileNm.add(tempFileNm);
		}
		return imgFileNm;
		
	}

}
