package customer.javaodata;

import org.springframework.context.support.ResourceBundleMessageSource;

import java.util.Locale;


public class MessageKeys {
    
    public String returnMessage(String Key){

            ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
            messageSource.addBasenames("messages");
            messageSource.setCacheSeconds(10);
            String message = messageSource.getMessage(Key, null, Locale.getDefault());
            return message;

    }


}