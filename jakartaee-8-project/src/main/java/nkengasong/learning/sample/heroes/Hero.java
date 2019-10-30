package nkengasong.learning.sample.heroes;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import lombok.Data;

/**
 *
 * @author nkengasong
 */
@Entity
@Data
class Hero implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @Column(nullable = false)
    private String fullname;
    private LocalDate created;
    private LocalDateTime lastModified;
    
    @PrePersist
    private void prePersist(){
        this.created = LocalDate.now();
    }
        
}
