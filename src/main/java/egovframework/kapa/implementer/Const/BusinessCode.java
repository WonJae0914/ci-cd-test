package egovframework.kapa.implementer.Const;

public enum BusinessCode {

	code0(0, "경제자유구역개발사업"),
	code1(1, "국방군사시설사업"),
	code10(10, "공공철도건설사업"),
	code100(100, "관광지조성사업"),
	code101(101, "군계획시설사업"),
	code102(102, "기타"),
	code103(103, "농업기반조성사업"),
	code104(16, "화북다목적댐"),
	code105(105, "물류단지개발사업"),
	code106(106, "보금자리주택사업"),
	code107(107, "부지조성사업"),
	code108(108, "광역상수도"),
	code109(109, "공공용시설사업"),
	code11(11, "고속철도건설사업"),
	code110(110, "국민임대주택건설사업"),
	code111(111, "특구개발사업"),
	code112(112, "항만사업"),
	code113(113, "혁신도시개발사업"),
	code12(12, "도시철도사업"),
	code13(13, "산업단지조성사업"),
	code14(14, "지방산업단지개발사업"),
	code15(15, "댐건설사업"),
	code16(16, "농어촌도로정비사업"),
	code17(17, "생활환경정비사업"),
	code18(18, "공원사업"),
	code19(19, "생태원조성사업"),
	code2(2, "도로사업"),
	code20(20, "토지구획정리사업"),
	code21(21, "학교시설사업"),
	code22(22, "도시개발사업"),
	code23(23, "공항개발사업"),
	code24(24, "도시환경정비사업"),
	code25(25, "수도사업"),
	code26(26, "유통단지조성사업"),
	code27(27, "철도건설사업"),
	code28(28, "전원개발사업"),
	code3(3, "하천사업"),
	code30(30, "비관리청하천사업"),
	code31(31, "소하천정비사업"),
	code32(32, "재개발정비사업"),
	code33(33, "주거환경개선사업"),
	code34(34, "공공하수도사업"),
	code35(35, "농공단지조성사업"),
	code36(36, "민간투자사업"),
	code37(37, "문화재보호구역정비"),
	code38(38, "사회복지사업"),
	code39(39, "농어촌정비사업"),
	code4(4, "도시계획시설사업"),
	code40(40, "단지조성사업"),
	code41(41, "도심재개발사업"),
	code42(42, "지역개발사업"),
	code43(43, "국가산업단지"),
	code44(44, "전기통신사업"),
	code45(45, "대지조성사업"),
	code46(46, "천연가스사업"),
	code47(47, "폐기물처리시설사업"),
	code48(48, "국민임대주택단지조성"),
	code49(49, "주택건설"),
	code5(5, "택지개발사업"),
	code50(50, "문화시설사업"),
	code6(6, "주택건설사업"),
	code60(60, "신항만건설사업"),
	code61(61, "오지개발사업"),
	code7(7, "주택재개발사업"),
	code77(77, "농업기반정비사업"),
	code78(78, "공공주택사업"),
	code8(8, "산업단지개발사업"),
	code80(80, "도로확장공사"),
	code81(81, "사방사업"),
	code83(83, "공유수면관리사업"),
	code88(88, "개발촉진지구사업"),
	code9(9, "수자원개발사업"),
	code92(92, "일반산업단지개발사업"),
	code99(61, "재해복구사업");
	

    private int code;
    private String krName;

    BusinessCode(int code, String krName) {
        this.code = code;
        this.krName = krName;
    }

    public String getKrName() {
        return krName;
    }

    public int getCode() {
        return code;
    }

}
