package com.dao;

import java.util.List;

import com.entity.Cart;

/**
 * CartDAO interface provides methods for performing operations on the Cart entity.
 * This includes adding a cart to the database.
 */
public interface CartDAO {
    
    public boolean addCart(Cart c);
    
    public List<Cart> getMobileByUser(int uid);
    
    //for a particular user a particular book with its id should be deleted
    public boolean deleteMobile(int mid, int uid, int cid);
}
