package ExceptionHandler;

public enum CustomizeErrorCode {

	SYS_ERROR("El servidor tiene un error, inténtalo de nuevo más tarde"),
    FILE_NOT_FIND("El recurso que está buscando no existe o se ha eliminado, puede ver otros artículos"),
    FILE_EXIST("El producto ya existe"),
    USER_NOT_LOGGED("El usuario no esa Logeado")
    ;
    private String message;

    CustomizeErrorCode(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
