package nkengasong.learning.sample.config;

import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.ejb.Startup;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.inject.Singleton;
import javax.sql.DataSource;
import org.flywaydb.core.Flyway;

/**
 *
 * @author nkengasong
 */
@Startup    // ensures the schema is updated only once:
@Singleton
@TransactionManagement(TransactionManagementType.BEAN)  // delegate the transaction handling to the bean and not the container
public class FlywayUpdater {

    private static final Logger LOG = Logger.getLogger(FlywayUpdater.class.getName());
    
    @Resource(lookup = "jdbc/postgresql")
    private DataSource dataSource;

    @PostConstruct
    public void initFlyway() {
        LOG.info("Began database schema migration with Flyway");
        Flyway flyway = Flyway.configure().dataSource(dataSource).load();
        flyway.migrate();
        LOG.info("Flyway successfully migrated latest database schema changes");
    }
}