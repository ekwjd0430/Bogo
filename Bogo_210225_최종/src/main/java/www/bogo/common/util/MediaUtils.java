package www.bogo.common.util;

import java.util.Map;
import java.util.HashMap;
import org.springframework.http.MediaType;

/**
 * 첨부파일 이미지 판별 
 */
public class MediaUtils {
	
	private static Map<String, MediaType> mediaMap;
	
	static {
		mediaMap = new HashMap<>();
		mediaMap.put("JPEG",MediaType.IMAGE_JPEG);
		mediaMap.put("JPG",MediaType.IMAGE_JPEG);
		mediaMap.put("PNG",MediaType.IMAGE_PNG);
		mediaMap.put("GIF",MediaType.IMAGE_GIF);
	}
	
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}

}
