package fi.palaute.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import fi.palaute.bean.Poletti;
import fi.palaute.bean.PolettiImpl;

public class PolettiRowMapper implements RowMapper <Poletti> {


	public Poletti mapRow(ResultSet rs, int rowNum) throws SQLException {
		Poletti p = new PolettiImpl();
		p.setPolettiID(rs.getInt("polettiID"));
		p.setKaytID(rs.getInt("kaytID"));
		p.setSatunnainen(rs.getString("satunnainen"));
		p.setPvm(rs.getString("vanhenemispvm"));
		
		return p;
	}

}
