// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.packt.hotel.portal.jpa.data;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.packt.hotel.portal.jpa.data.HmsRooms;
import org.springframework.transaction.annotation.Transactional;

privileged aspect HmsRooms_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager HmsRooms.entityManager;
    
    public static final List<String> HmsRooms.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager HmsRooms.entityManager() {
        EntityManager em = new HmsRooms().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long HmsRooms.countHmsRoomses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM HmsRooms o", Long.class).getSingleResult();
    }
    
    public static List<HmsRooms> HmsRooms.findAllHmsRoomses() {
        return entityManager().createQuery("SELECT o FROM HmsRooms o", HmsRooms.class).getResultList();
    }
    
    public static List<HmsRooms> HmsRooms.findAllHmsRoomses(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM HmsRooms o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, HmsRooms.class).getResultList();
    }
    
    public static HmsRooms HmsRooms.findHmsRooms(Long id) {
        if (id == null) return null;
        return entityManager().find(HmsRooms.class, id);
    }
    
    public static List<HmsRooms> HmsRooms.findHmsRoomsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM HmsRooms o", HmsRooms.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<HmsRooms> HmsRooms.findHmsRoomsEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM HmsRooms o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, HmsRooms.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void HmsRooms.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void HmsRooms.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            HmsRooms attached = HmsRooms.findHmsRooms(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void HmsRooms.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void HmsRooms.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public HmsRooms HmsRooms.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        HmsRooms merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
