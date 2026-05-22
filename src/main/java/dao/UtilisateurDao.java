package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Utilisateur;

public class UtilisateurDao {

	public static boolean ajouter(Utilisateur utilisateur) {
		String sql = "INSERT INTO utilisateur (nom, prenom, login, password) VALUES (?, ?, ?, ?)";
		try (Connection c = DBConnection.get();
		     PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
			ps.setString(1, utilisateur.getNom());
			ps.setString(2, utilisateur.getPrenom());
			ps.setString(3, utilisateur.getLogin());
			ps.setString(4, utilisateur.getPassword());
			int n = ps.executeUpdate();
			if (n == 0) return false;
			try (ResultSet keys = ps.getGeneratedKeys()) {
				if (keys.next()) utilisateur.setId(keys.getInt(1));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean modifier(Utilisateur utilisateur) {
		String sql = "UPDATE utilisateur SET nom = ?, prenom = ?, login = ?, password = ? WHERE id = ?";
		try (Connection c = DBConnection.get();
		     PreparedStatement ps = c.prepareStatement(sql)) {
			ps.setString(1, utilisateur.getNom());
			ps.setString(2, utilisateur.getPrenom());
			ps.setString(3, utilisateur.getLogin());
			ps.setString(4, utilisateur.getPassword());
			ps.setInt(5, utilisateur.getId());
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean supprimer(int id) {
		String sql = "DELETE FROM utilisateur WHERE id = ?";
		try (Connection c = DBConnection.get();
		     PreparedStatement ps = c.prepareStatement(sql)) {
			ps.setInt(1, id);
			return ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static ArrayList<Utilisateur> lister() {
		ArrayList<Utilisateur> utilisateurs = new ArrayList<>();
		String sql = "SELECT id, nom, prenom, login, password FROM utilisateur ORDER BY id";
		try (Connection c = DBConnection.get();
		     PreparedStatement ps = c.prepareStatement(sql);
		     ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				utilisateurs.add(new Utilisateur(
					rs.getInt("id"),
					rs.getString("nom"),
					rs.getString("prenom"),
					rs.getString("login"),
					rs.getString("password")
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return utilisateurs;
	}

	public static Utilisateur get(int id) {
		String sql = "SELECT id, nom, prenom, login, password FROM utilisateur WHERE id = ?";
		try (Connection c = DBConnection.get();
		     PreparedStatement ps = c.prepareStatement(sql)) {
			ps.setInt(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return new Utilisateur(
						rs.getInt("id"),
						rs.getString("nom"),
						rs.getString("prenom"),
						rs.getString("login"),
						rs.getString("password")
					);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
