package nkengasong.learning.sample.heroes;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.eclipse.microprofile.config.inject.ConfigProperty;

@Path("heroes")
@Transactional
@RequestScoped // You may replace @Transactional and @RequestScoped with @Stateless
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class HeroesResource {

	@Inject
	@ConfigProperty(name = "message")
	private String message;
        
	@Inject
	@ConfigProperty(name = "number_of_heroes", defaultValue = "10")
	private Integer numberOfHeroes;
        
        @PersistenceContext
        private EntityManager em;

	@GET
	public Response getHeroes() {
             var heroes = em.createQuery("FROM Hero h", Hero.class)
                     .setMaxResults(numberOfHeroes)
                     .getResultList();
             System.out.println(heroes);
		return Response.ok(message).build();
	}

}
