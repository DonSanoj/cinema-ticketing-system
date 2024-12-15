/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.dao;

import com.abc.cinema.models.Movie;
import com.abc.cinema.utils.DbConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Himantha
 */
public class MovieDAO {

    public void addMovie(Movie movie) throws SQLException {

        String query = "INSERT INTO movies (movie_name, movie_image, genre, language, duration, description, director, main_actor, other_actors, trailer_link, movie_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DbConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, movie.getMovieName());
            statement.setString(2, movie.getMovieImage());
            statement.setString(3, movie.getGenre());
            statement.setString(4, movie.getLanguage());
            statement.setInt(5, movie.getDuration());
            statement.setString(6, movie.getDescription());
            statement.setString(7, movie.getDirector());
            statement.setString(8, movie.getMainActor());
            statement.setString(9, movie.getOtherActors());
            statement.setString(10, movie.getTrailerLink());
            statement.setString(11, movie.getMovieStatus());

            statement.executeUpdate();
        }
    }

    // Fetch all movies
    public ArrayList<Movie> getAllMovies() throws SQLException {
        ArrayList<Movie> movies = new ArrayList<>();
        String query = "SELECT * FROM movies WHERE movie_status = 1";

        try (Connection connection = DbConnection.getConnection(); Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieId(rs.getInt("movie_id"));
                movie.setMovieName(rs.getString("movie_name"));
                movie.setMovieImage(rs.getString("movie_image"));
                movie.setGenre(rs.getString("genre"));
                movie.setLanguage(rs.getString("language"));
                movie.setDuration(rs.getInt("duration"));
                movie.setDescription(rs.getString("description"));
                movie.setDirector(rs.getString("director"));
                movie.setMainActor(rs.getString("main_actor"));
                movie.setOtherActors(rs.getString("other_actors"));
                movie.setTrailerLink(rs.getString("trailer_link"));
                movie.setMovieStatus(rs.getString("movie_status"));
                movies.add(movie);
            }
        }
        return movies;
    }

    // Fetch coming soon movies
    public ArrayList<Movie> getComingSoonMovies() throws SQLException {
        ArrayList<Movie> moviesComingSoon = new ArrayList<>();
        String query = "SELECT * FROM movies WHERE movie_status = 0";

        try (Connection connection = DbConnection.getConnection(); Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieId(rs.getInt("movie_id"));
                movie.setMovieName(rs.getString("movie_name"));
                movie.setMovieImage(rs.getString("movie_image"));
                movie.setGenre(rs.getString("genre"));
                movie.setLanguage(rs.getString("language"));
                movie.setDuration(rs.getInt("duration"));
                movie.setDescription(rs.getString("description"));
                movie.setDirector(rs.getString("director"));
                movie.setMainActor(rs.getString("main_actor"));
                movie.setOtherActors(rs.getString("other_actors"));
                movie.setTrailerLink(rs.getString("trailer_link"));
                movie.setMovieStatus(rs.getString("movie_status"));
                moviesComingSoon.add(movie);
            }
        }
        return moviesComingSoon;
    }

    public Movie getMovieDetailsById(int movieId) throws SQLException {
        String query = "SELECT * FROM movies WHERE movie_id = ?";

        try (Connection connection = DbConnection.getConnection(); PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setInt(1, movieId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Movie movie = new Movie();
                    movie.setMovieId(rs.getInt("movie_id"));
                    movie.setMovieName(rs.getString("movie_name"));
                    movie.setMovieImage(rs.getString("movie_image"));
                    movie.setGenre(rs.getString("genre"));
                    movie.setLanguage(rs.getString("language"));
                    movie.setDuration(rs.getInt("duration"));
                    movie.setDescription(rs.getString("description"));
                    movie.setDirector(rs.getString("director"));
                    movie.setMainActor(rs.getString("main_actor"));
                    movie.setOtherActors(rs.getString("other_actors"));
                    movie.setTrailerLink(rs.getString("trailer_link"));
                    movie.setMovieStatus(rs.getString("movie_status"));
                    return movie;
                }
            }
            return null;
        }
    }
}
