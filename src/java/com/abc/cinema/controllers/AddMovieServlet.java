/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

/**
 *
 * @author Himantha
 */

package com.abc.cinema.controllers;

import com.abc.cinema.dao.MovieDAO;
import com.abc.cinema.models.Movie;
import com.dropbox.core.DbxException;

import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.files.FileMetadata;
import com.dropbox.core.v2.sharing.CreateSharedLinkWithSettingsErrorException;
import com.dropbox.core.v2.sharing.SharedLinkMetadata;

import java.io.IOException;
import java.io.InputStream;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/Admin/add_movies")
@MultipartConfig
public class AddMovieServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DROPBOX_ACCESS_TOKEN = "sl.CCtxqfUDk6EI5eqKmM3ueDzvLIUqa_wgvd2vkGCPVgb_r55w3EYTQc76yon6G6KFVdt_hBBs5Ju0PawkCVaCyT7G04PwclyctzQBV7_SYTOF7QsHfCmBRqks3VFuPAfhIeGAhzirheedNQFW6i4Q9AM";
    private static final String DROPBOX_FOLDER = "/uploads/";

    private final MovieDAO moviedao = new MovieDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Movie details from the form
        String movieName = req.getParameter("movie_name");
        String genre = req.getParameter("genre");
        String language = req.getParameter("language");
        int duration = Integer.parseInt(req.getParameter("duration"));
        String description = req.getParameter("description");
        String director = req.getParameter("director");
        String mainActor = req.getParameter("main_actor");
        String otherActors = req.getParameter("other_actors");
        String trailer_link = req.getParameter("trailer_link");
        String movie_status = req.getParameter("movie_status");

        String movieImage = null;

        try {
            // Handle file upload
            Part imagePart = req.getPart("movie_image");
            if (imagePart != null && imagePart.getSize() > 0) {
                // Upload file to Dropbox and get shared link
                movieImage = uploadToDropbox(imagePart);
            }

            // Create a Movie object and save it to the database
            Movie movie = new Movie(0, movieName, movieImage, genre, language, duration, description, director, mainActor, otherActors, trailer_link, movie_status);
            moviedao.addMovie(movie);

            // Set success message and redirect to the form
            req.setAttribute("successMessage", "Movie added successfully!");
            req.getRequestDispatcher("/Admin/add_movies.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Unable to add movie: " + e.getMessage());
            req.getRequestDispatcher("/Admin/add_movies.jsp").forward(req, res);
        }
    }

    /**
     * Uploads a file to Dropbox and returns a direct download URL.
     *
     * @param filePart the file part to upload
     * @return the direct download URL of the uploaded file
     * @throws ServletException if an error occurs during file upload or link
     * creation
     */
    private String uploadToDropbox(Part filePart) throws ServletException {
        DbxRequestConfig config = DbxRequestConfig.newBuilder("cinema-app").build();
        DbxClientV2 client = new DbxClientV2(config, DROPBOX_ACCESS_TOKEN);

        String fileName = getFileName(filePart);
        String dropboxPath = DROPBOX_FOLDER + fileName;

        try (InputStream inputStream = filePart.getInputStream()) {
            // Upload the file to Dropbox
            FileMetadata metadata = client.files().uploadBuilder(dropboxPath)
                    .uploadAndFinish(inputStream);

            // Create or retrieve a shared link
            return getOrCreateSharedLink(client, dropboxPath);

        } catch (Exception e) {
            throw new ServletException("Error uploading file to Dropbox", e);
        }
    }

    /**
     * Creates or retrieves a shared link for a file in Dropbox.
     *
     * @param client the Dropbox client
     * @param filePath the file path in Dropbox
     * @return the direct download URL of the file
     * @throws ServletException if an error occurs during link creation
     */
    private String getOrCreateSharedLink(DbxClientV2 client, String filePath) throws ServletException, DbxException {
        try {
            SharedLinkMetadata sharedLink = client.sharing().createSharedLinkWithSettings(filePath);
            return sharedLink.getUrl().replace("?dl=0", "?dl=1");
        } catch (CreateSharedLinkWithSettingsErrorException e) {
            if (e.errorValue.isSharedLinkAlreadyExists()) {
                // Retrieve existing shared link
                return client.sharing().listSharedLinksBuilder()
                        .withPath(filePath)
                        .withDirectOnly(true)
                        .start()
                        .getLinks()
                        .get(0)
                        .getUrl()
                        .replace("?dl=0", "?dl=1");
            } else {
                throw new ServletException("Error creating shared link", e);
            }
        } catch (Exception e) {
            throw new ServletException("Unexpected error during shared link creation", e);
        }
    }

    /**
     * Extracts the file name from a Part header.
     *
     * @param part the Part object
     * @return the extracted file name
     */
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String content : contentDisposition.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 2, content.length() - 1);
            }
        }
        return null;
    }
}
