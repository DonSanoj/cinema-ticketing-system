/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.models;

/**
 *
 * @author Himantha
 */
public class SeatStatus {

    private int seat_status_id;
    private int showtime_id;
    private String seat_id;
    private String status;

    public SeatStatus() {

    }

    public SeatStatus(int seat_status_id, int showtime_id, String seat_id, String status) {

        this.seat_status_id = seat_status_id;
        this.showtime_id = showtime_id;
        this.seat_id = seat_id;
        this.status = status;
    }

    public int getSeatStatusID() {
        return seat_status_id;
    }

    public void setSeatStatusID(int seat_status_id) {
        this.seat_status_id = seat_status_id;
    }

    public int getShowtimeID() {
        return showtime_id;
    }

    public void setShowtimeID(int showtime_id) {
        this.showtime_id = showtime_id;
    }

    public String getSeatID() {
        return seat_id;
    }

    public void setSeatID(String seat_id) {
        this.seat_id = seat_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
