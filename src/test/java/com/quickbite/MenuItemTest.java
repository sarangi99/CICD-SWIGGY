package com.quickbite;

import org.junit.Test;
import static org.junit.Assert.*;

public class MenuItemTest {
    @Test
    public void storesMenuItemDetails() {
        MenuItem item = new MenuItem("Masala Dosa", 120);
        assertEquals("Masala Dosa", item.getName());
        assertEquals(120, item.getPriceRupees());
    }

    @Test(expected = IllegalArgumentException.class)
    public void rejectsNegativePrice() {
        new MenuItem("Masala Dosa", -1);
    }
}
