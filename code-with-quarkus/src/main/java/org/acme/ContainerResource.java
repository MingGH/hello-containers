package org.acme;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/")
public class ContainerResource {

    @GET
    @Path("")
    @Produces(MediaType.TEXT_PLAIN)
    public String index() {
        return "Hello from Quarkus REST";
    }

    @GET
    @Path("/container/{id}")
    @Produces(MediaType.TEXT_PLAIN)
    public String container(@PathParam("id") String id) {
        return "container result: " + id;
    }

    @GET
    @Path("/error")
    @Produces(MediaType.TEXT_PLAIN)
    public String error() {
        return "error";
    }


}
