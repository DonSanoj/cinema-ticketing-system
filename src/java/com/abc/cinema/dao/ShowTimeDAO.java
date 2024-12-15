/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.dao;

import com.abc.cinema.models.ShowTimes;
import com.abc.cinema.models.ShowTimeDetails;
import com.abc.cinema.utils.DbConnection;
import com.abc.cinema.models.Movie;

import com.google.gson.JsonObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DON
 */
public class ShowTimeDAO {

    private Connection connection;

    public ShowTimeDAO(Connection connection) {
        this.connection = connection;
    }

    //Method to add new showtime
    public void addShowTime(ShowTimes showtimes) throws SQLException {

        String query = "INSERT INTO showtimes (movie_id, complex_id, hall_id, start_time, date) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, showtimes.getMovieId());
            statement.setInt(2, showtimes.getComplexId());
            statement.setInt(3, showtimes.getHallId());
            statement.setString(4, showtimes.getStartTime());
            statement.setString(5, showtimes.getDate());

            statement.executeUpdate();
        }
    }

    //Method to retrieve all showtimes by movid id
    public ArrayList<ShowTimeDetails> getShowTimesByMovieId(int movie_id) throws SQLException {
        ArrayList<ShowTimeDetails> showTimeDetailsList = new ArrayList<>();
        String query = "SELECT st.showtime_id, st.start_time, st.date, "
                + "h.hall_name, c.complex_name "
                + "FROM showtimes st "
                + "JOIN halls h ON st.hall_id = h.hall_id "
                + "JOIN complexes c ON st.complex_id = c.complex_id "
                + "WHERE st.movie_id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, movie_id);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    ShowTimeDetails details = new ShowTimeDetails(
                            rs.getInt("showtime_id"),
                            rs.getString("start_time"),
                            rs.getString("date"),
                            rs.getString("hall_name"),
                            rs.getString("complex_name")
                    );
                    showTimeDetailsList.add(details);
                }
            }
        }

        return showTimeDetailsList;
    }

    public Movie getMovieDetailsByShowtimeId(int showtimeId) {
        Movie movieDetails = null;
        String query = """
            SELECT m.movie_id, m.movie_name, m.movie_image, m.genre, m.language, m.duration, 
                   m.description, m.director, m.main_actor, m.other_actors, m.trailer_link, m.movie_status
            FROM movies m
            INNER JOIN showtimes s ON m.movie_id = s.movie_id
            WHERE s.showtime_id = ?
        """;

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, showtimeId);  // Set the showtime_id parameter for the query

            // Execute the query
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Create the Movie object with all the data
                int movieId = rs.getInt("movie_id");
                String movieName = rs.getString("movie_name");
                String movieImage = rs.getString("movie_image");
                String genre = rs.getString("genre");
                String language = rs.getString("language");
                int duration = rs.getInt("duration");
                String description = rs.getString("description");
                String director = rs.getString("director");
                String mainActor = rs.getString("main_actor");
                String otherActors = rs.getString("other_actors");
                String trailerLink = rs.getString("trailer_link");
                String movieStatus = rs.getString("movie_status");

                // Instantiate the Movie object
                movieDetails = new Movie(movieId, movieName, movieImage, genre, language, duration,
                        description, director, mainActor, otherActors, trailerLink, movieStatus);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log the exception (you may want to handle it more gracefully)
        }

        return movieDetails;
    }
}
