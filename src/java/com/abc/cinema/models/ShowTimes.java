/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.models;

/**
 *
 * @author Himantha
 */
public class ShowTimes {

    private int showtime_id;
    private int movie_id;
    private int complex_id;
    private int hall_id;
    private String start_time;
    private String date;

    public ShowTimes(int showtime_id, int movie_id, int complex_id, int hall_id, String start_time, String date) {

        this.showtime_id = showtime_id;
        this.movie_id = movie_id;
        this.complex_id = complex_id;
        this.hall_id = hall_id;
        this.start_time = start_time;
        this.date = date;
    }

    // Getters and Setters
    public int getShowtimeId() {
        return showtime_id;
    }

    public void setShowtimeId(int showtime_id) {
        this.showtime_id = showtime_id;
    }

    public int getMovieId() {
        return movie_id;
    }

    public void setMovieId(int movie_id) {
        this.movie_id = movie_id;
    }

    public int getComplexId() {
        return complex_id;
    }

    public void setComplexId(int complex_id) {
        this.complex_id = complex_id;
    }

    public int getHallId() {
        return hall_id;
    }

    public void setHallId(int hall_id) {
        this.hall_id = hall_id;
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

}
