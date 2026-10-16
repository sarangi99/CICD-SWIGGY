package com.quickbite;

public class MenuItem {
    private final String name;
    private final int priceRupees;

    public MenuItem(String name, int priceRupees) {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Name is required");
        }
        if (priceRupees < 0) {
            throw new IllegalArgumentException("Price cannot be negative");
        }
        this.name = name;
        this.priceRupees = priceRupees;
    }

    public String getName() { return name; }
    public int getPriceRupees() { return priceRupees; }
}
