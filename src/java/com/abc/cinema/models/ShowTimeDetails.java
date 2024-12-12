/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.models;

/**
 *
 * @author Himantha
 */
public class ShowTimeDetails {

    private int showtime_id;
    private String start_time;
    private String date;
    private String hall_name;
    private String complex_name;

    public ShowTimeDetails() {
    }

    public ShowTimeDetails(int showtime_id, String start_time, String date, String hall_name, String complex_name) {
        this.showtime_id = showtime_id;
        this.start_time = start_time;
        this.date = date;
        this.hall_name = hall_name;
        this.complex_name = complex_name;
    }

    // Getters and Setters
    public int getShowtimeId() {
        return showtime_id;
    }

    public void setShowtimeId(int showtime_id) {
        this.showtime_id = showtime_id;
    }

    public String getStartTime() {
        return start_time;
    }

    public void setStartTime(String start_time) {
        this.start_time = start_time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getHallName() {
        return hall_name;
    }

    public void setHallName(String hall_name) {
        this.hall_name = hall_name;
    }

    public String getComplexName() {
        return complex_name;
    }

    public void setComplexName(String complex_name) {
        this.complex_name = complex_name;
    }
}
