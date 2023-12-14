/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.List;

/**
 *
 * @author lythanhphat9523
 */
public interface iDAO<T> {
    public Boolean insert(T a);
    public Boolean update(T a);
    public Boolean delete(T a);
    public List<T> findAll();
    public T findById(String id);
}
