package com.pfs.restful.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class FakturItem {

    /**
     */
    @ManyToOne
    private Merchandise merchandise;

    /**
     */
    @NotNull
    private int qty;

    /**
     */
    @ManyToOne
    private Faktur faktur;
}
