package customer.verificationproject;

import org.springframework.context.support.ResourceBundleMessageSource;
import java.util.Locale;

public class ServiceKey {
    
    public String returnMessage(String Key){

           ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
            messageSource.addBasenames("messages");
            messageSource.setCacheSeconds(10);
            String message = messageSource.getMessage(Key, null, Locale.getDefault());
            return message;
    }
}
