package com.one.mat.main.dao;

import java.util.List;
import java.util.Map;

public interface MatchingDAO {

	List<Map<String, Object>> matchingList();

	List<String> matchingListCharType4();

	List<String> matchingListCharType3();

	List<String> matchingListCharType2();

	List<String> matchingListCharType1();

}
