/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.models;


/**
 *
 * @author Himantha
 */

public class Movie {

    private int movieId;
    private String movieName;
    private String movieImage;
    private String genre;
    private String language;
    private int duration;
    private String description;
    private String director;
    private String mainActor;
    private String otherActors;
    private String trailer_link;
    private String movie_status;

    public Movie() {
    }

    public Movie(int movieId, String movieName, String movieImage, String genre, String language, int duration, String description, String director, String mainActor, String otherActors, String trailer_link, String movie_status) {

        this.movieId = movieId;
        this.movieName = movieName;
        this.movieImage = movieImage;
        this.genre = genre;
        this.language = language;
        this.duration = duration;
        this.description = description;
        this.director = director;
        this.mainActor = mainActor;
        this.otherActors = otherActors;
        this.trailer_link = trailer_link;
        this.movie_status = movie_status;
    }

    // Getters and Setters
    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieImage() {
        return movieImage;
    }

    public void setMovieImage(String movieImage) {
        this.movieImage = movieImage;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
    
    public String getLanguage() {
        return language;
    }
    
    public void setLanguage(String language) {
        this.language = language;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getMainActor() {
        return mainActor;
    }

    public void setMainActor(String mainActor) {
        this.mainActor = mainActor;
    }

    public String getOtherActors() {
        return otherActors;
    }

    public void setOtherActors(String otherActors) {
        this.otherActors = otherActors;
    }
    
    public String getTrailerLink() {
        return trailer_link;
    }
    
    public void setTrailerLink(String trailer_link) {
        this.trailer_link = trailer_link;
    }
    
    public String getMovieStatus() {
        return movie_status;
    }
    
    public void setMovieStatus(String movie_status) {
        this.movie_status = movie_status;
    }

}
