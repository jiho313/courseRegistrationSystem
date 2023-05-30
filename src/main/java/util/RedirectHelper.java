package util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class RedirectHelper {

    /**
     * 페이지와 에러 타입, 메시지를 받아서, UTF-8로 인코딩된 에러 메시지와 함께 리디렉션 URL을 반환한다.
     *
     * @param page 리디렉션 대상 페이지
     * @param errorValue 에러의 값
     * @param message 인코딩할 메시지
     * @return UTF-8로 인코딩된 에러 메시지와 함께하는 리디렉션 URL
     */
    public static String redirectWithError(String page, String errorValue, String message) {
        try {
            String encodedMessage = (message != null && !message.isBlank())
                ? "&job=" + URLEncoder.encode(message, "utf-8")
                : "";
            return page + "?err=" + errorValue + encodedMessage;
        } catch (UnsupportedEncodingException e) {
            // UTF-8을 지원하지 않는 경우의 예외 처리
            e.printStackTrace();
            return page;
        }
    }
}
