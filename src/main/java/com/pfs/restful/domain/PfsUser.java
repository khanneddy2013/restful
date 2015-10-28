package com.pfs.restful.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class PfsUser {

    /**
     */
    @NotNull
    @Size(min = 5)
    private String username;

    /**
     */
    @NotNull
    @Size(min = 6)
    private String password;
}
