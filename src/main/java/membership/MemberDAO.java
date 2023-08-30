package membership;

import javax.servlet.ServletContext;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import common.JDBConnect;
/*
	DAO(data access object) : 실제 DB에 접근하여 여러가지 CRUD작업을
		하기위한 객체(Create Read Update Delete)
*/
public class MemberDAO extends JDBConnect
{
	// 생성자 메서드
	// 매개변수가 4개인 부모의 생성자를 호출하여 DB에 연결한다.
	public MemberDAO(String drv, String url, String id, String pw)
	{
		super(drv, url, id, pw);
	}
	// application 내장객체만 매개변수로 전달한 후 DB에 연결한다.
	public MemberDAO(ServletContext application)
	{
		super(application);
	}
	
	/*
		사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 select한 후
		존재하는 정보인 경우 DTO객체에 그 정보를 담아 반환한다.
	*/
	public MemberDTO getMemberDTO(String uid, String upass)
	{
		// 로그인을 위한 쿼리문을 실행한 후 회원정보를 저장하기 위해 생성
		MemberDTO dto = new MemberDTO();
		// 로그인을 위해 인파라미터가 있는 동적 쿼리문 작성
		String query = "Select * from member where id=? and pass=?";
		try
		{
			// 쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 생성
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			// select 쿼리문을 실행한 후 ResultSet으로 반환받는다.
			rs = psmt.executeQuery();

			// 반환된 ResultSet객체를 통해 회원정보가 있는지 확인한다.
			if (rs.next())
				// 정보가 있다면 DTO객체에서 회원정보를 저장
			{
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		// 호출한 지점으로 DTO객체를 반환한다.
		return dto;
	}
    public int insertMember(MemberDTO member) {
        String id = member.getId();
        String name = member.getName();

        // 아이디 중복 체크
        if (isIdDuplicated(id)) {
            return -1; // id가 중복됨
        }

        // 이름 중복 체크
        if (isNameDuplicated(name)) {
            return -2; // name이 중복됨
        }

        // 중복이 아니라면 회원 정보 삽입
        String query = "INSERT INTO member (id, pass, regidate) VALUES (?, ?, ?)";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, member.getId());
            psmt.setString(2, member.getPass());
            
            // 현재 시간을 가져와서 regidate에 설정
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            psmt.setTimestamp(3, timestamp);

            int result = psmt.executeUpdate();
            return result; // 0이상 값이 return된 경우 성공
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -3; // DB 오류
    }

    /*
        아이디 중복 체크 메서드
    */
    private boolean isIdDuplicated(String id) {
        String query = "SELECT id FROM member WHERE id = ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();
            return rs.next(); // 결과가 존재하면 중복
        } catch (Exception e) {
        	System.out.println("아이디중복");
            e.printStackTrace();
        }
        return false; // DB 오류로 중복 처리 불가
    }

    /*
        이름 중복 체크 메서드
    */
    private boolean isNameDuplicated(String name) {
        String query = "SELECT name FROM member WHERE name = ?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, name);
            rs = psmt.executeQuery();
            return rs.next(); // 결과가 존재하면 중복
        } catch (Exception e) {
        	System.out.println("이름중복");
            e.printStackTrace();
        }
        return false; // DB 오류로 중복 처리 불가
    }
}


