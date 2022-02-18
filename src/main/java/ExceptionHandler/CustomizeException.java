package ExceptionHandler;

import org.springframework.security.config.Customizer;

@SuppressWarnings("serial")
public class CustomizeException extends RuntimeException {

	private String message;
    @SuppressWarnings("rawtypes")
	public CustomizeException(Customizer errorCode) {
        this.message = ((CustomizeException) errorCode).getMessage();
    }

    public CustomizeException(CustomizeErrorCode fileNotFind) {
    	this.message = fileNotFind.getMessage();
}

	@Override
    public String getMessage() {
        return message;
    }
}
