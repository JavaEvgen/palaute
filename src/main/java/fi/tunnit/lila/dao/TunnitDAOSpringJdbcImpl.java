package fi.tunnit.lila.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import fi.tunnit.lila.bean.Tunnit;



@Repository
public class TunnitDAOSpringJdbcImpl implements TunnitDAO {

	@Inject
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/**
	 * Tallettaa parametrina annetun henkilön tietokantaan. Tietokannan
	 * generoima id asetetaan parametrina annettuun olioon.
	 */
	public void talleta(Tunnit t) {
		final String sql = "insert into tunnit(kaytID, projID, date, aloitusaika, lopetusaika, kuvaus) values(?,?,?,?,?,?)";

		// anonyymi sisäluokka tarvitsee vakioina välitettävät arvot,
		// jotta roskien keruu onnistuu tämän metodin suorituksen päättyessä.
		final int kaytID = t.getKaytID();
		final int projID = t.getProjID();
		final String date = t.getDate();
		final String aloitusaika = t.getAloitusaika();
		final String lopetusaika = t.getLopetusaika();
		final String kuvaus = t.getKuvaus();

		// jdbc pistää generoidun id:n tänne talteen
		KeyHolder idHolder = new GeneratedKeyHolder();

		// suoritetaan päivitys itse määritellyllä PreparedStatementCreatorilla
		// ja KeyHolderilla
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql,
						new String[] { "id" });
				ps.setInt(1, kaytID);
				ps.setInt(2, projID);
				ps.setString(3, date);
				ps.setString(4, aloitusaika);
				ps.setString(4, lopetusaika);
				ps.setString(4, kuvaus);
				return ps;
			}
		}, idHolder);

		// tallennetaan id takaisin beaniin, koska
		// kutsujalla pitäisi olla viittaus samaiseen olioon
		t.setTuntiID(idHolder.getKey().intValue());

	}

	public List<Tunnit> etsi(int kaytID) {
		String sql = "select kaytID,projID,date, aloitusaika, lopetusaika, kuvaus from tunnit where kaytID = ?";
		Object[] parametrit = new Object[] { kaytID };
		RowMapper<Tunnit> mapper = new TunnitRowMapper();
		List<Tunnit> tunnit = jdbcTemplate.query(sql,parametrit, mapper);

		return tunnit;

	}

	public List<Tunnit> haeTunnit() {

		String sql = "select kaytID,projID,date, aloitusaika, lopetusaika, kuvaus from tunnit";
		RowMapper<Tunnit> mapper = new TunnitRowMapper();
		List<Tunnit> tunnit = jdbcTemplate.query(sql, mapper);

		return tunnit;
		
		
	}
}