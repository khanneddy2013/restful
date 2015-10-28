// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pfs.restful.domain;

import com.pfs.restful.domain.PfsUser;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PfsUser_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager PfsUser.entityManager;
    
    public static final List<String> PfsUser.fieldNames4OrderClauseFilter = java.util.Arrays.asList("username", "password");
    
    public static final EntityManager PfsUser.entityManager() {
        EntityManager em = new PfsUser().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PfsUser.countPfsUsers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PfsUser o", Long.class).getSingleResult();
    }
    
    public static List<PfsUser> PfsUser.findAllPfsUsers() {
        return entityManager().createQuery("SELECT o FROM PfsUser o", PfsUser.class).getResultList();
    }
    
    public static List<PfsUser> PfsUser.findAllPfsUsers(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PfsUser o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PfsUser.class).getResultList();
    }
    
    public static PfsUser PfsUser.findPfsUser(Long id) {
        if (id == null) return null;
        return entityManager().find(PfsUser.class, id);
    }
    
    public static List<PfsUser> PfsUser.findPfsUserEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PfsUser o", PfsUser.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<PfsUser> PfsUser.findPfsUserEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PfsUser o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PfsUser.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void PfsUser.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PfsUser.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PfsUser attached = PfsUser.findPfsUser(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PfsUser.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PfsUser.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PfsUser PfsUser.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PfsUser merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
