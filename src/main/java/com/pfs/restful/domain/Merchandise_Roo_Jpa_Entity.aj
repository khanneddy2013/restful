// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pfs.restful.domain;

import com.pfs.restful.domain.Merchandise;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Merchandise_Roo_Jpa_Entity {
    
    declare @type: Merchandise: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Merchandise.id;
    
    @Version
    @Column(name = "version")
    private Integer Merchandise.version;
    
    public Long Merchandise.getId() {
        return this.id;
    }
    
    public void Merchandise.setId(Long id) {
        this.id = id;
    }
    
    public Integer Merchandise.getVersion() {
        return this.version;
    }
    
    public void Merchandise.setVersion(Integer version) {
        this.version = version;
    }
    
}