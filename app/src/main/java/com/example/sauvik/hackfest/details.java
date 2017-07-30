package com.example.sauvik.hackfest;
/**
 * Created by j3rw1n on 20/1/17.
 */

public class details {
    private String name;
    private long id;
    private String image;
    private float price;
    public details(String name,float price,long id){
        // super();
        this.id = id;
        this.name = name;
        this.price = price;
    }
    public String getName(){
        return name;
    }
    public float getPrice(){
        return price;
    }
    public long getId(){
        return id;
    }
}
