package ExceptionHandler;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ErrorAdvice {

	// Interceptar todas las excepciones y manejarlas
    @ExceptionHandler(Exception.class)
    ModelAndView handle(HttpServletRequest request, Throwable e, Model model) {
        // Si el tipo de excepción es una excepción personalizada
        if(e instanceof BindException){
            model.addAttribute("errorMsg",e.getMessage());
        }else{
            // Otras excepciones
            model.addAttribute("errorMsg","El servidor tiene un error, inténtalo de nuevo más tarde");
        }
        return new ModelAndView("error");
    }
}
