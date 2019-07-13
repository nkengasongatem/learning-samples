package app;

import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

/**
 *
 * @author nkengasong
 */
@Named
@RequestScoped
public class PersonController implements Serializable {

    private Person person;

    @PostConstruct
    public void init() {
        person = new Person();
    }

    public Person getPerson() {
        return person;
    } 

    public Title[] getTitles() {
        return Title.values();
    }
    
}
