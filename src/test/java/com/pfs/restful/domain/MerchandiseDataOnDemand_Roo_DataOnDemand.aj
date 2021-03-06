// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.pfs.restful.domain;

import com.pfs.restful.domain.Merchandise;
import com.pfs.restful.domain.MerchandiseDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect MerchandiseDataOnDemand_Roo_DataOnDemand {
    
    declare @type: MerchandiseDataOnDemand: @Component;
    
    private Random MerchandiseDataOnDemand.rnd = new SecureRandom();
    
    private List<Merchandise> MerchandiseDataOnDemand.data;
    
    public Merchandise MerchandiseDataOnDemand.getNewTransientMerchandise(int index) {
        Merchandise obj = new Merchandise();
        setName(obj, index);
        setPrice(obj, index);
        return obj;
    }
    
    public void MerchandiseDataOnDemand.setName(Merchandise obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void MerchandiseDataOnDemand.setPrice(Merchandise obj, int index) {
        double price = new Integer(index).doubleValue();
        obj.setPrice(price);
    }
    
    public Merchandise MerchandiseDataOnDemand.getSpecificMerchandise(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Merchandise obj = data.get(index);
        Long id = obj.getId();
        return Merchandise.findMerchandise(id);
    }
    
    public Merchandise MerchandiseDataOnDemand.getRandomMerchandise() {
        init();
        Merchandise obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Merchandise.findMerchandise(id);
    }
    
    public boolean MerchandiseDataOnDemand.modifyMerchandise(Merchandise obj) {
        return false;
    }
    
    public void MerchandiseDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Merchandise.findMerchandiseEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Merchandise' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Merchandise>();
        for (int i = 0; i < 10; i++) {
            Merchandise obj = getNewTransientMerchandise(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
