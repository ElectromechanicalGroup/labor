package com.oracle.labor.dao;

import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpdjbExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ZjDwzpdjbMapper {
	
	Map<String, Object> selectByBioNo(String bioNo);
	
	ZjDwzpdjb selectById(String id);
	
    long countByExample(ZjDwzpdjbExample example);

    int deleteByExample(ZjDwzpdjbExample example);

    int deleteByPrimaryKey(String zpbh);

    int insert(ZjDwzpdjb record);

    int insertSelective(ZjDwzpdjb record);

    List<ZjDwzpdjb> selectByExample(ZjDwzpdjbExample example);

    ZjDwzpdjb selectByPrimaryKey(String zpbh);

    int updateByExampleSelective(@Param("record") ZjDwzpdjb record, @Param("example") ZjDwzpdjbExample example);

    int updateByExample(@Param("record") ZjDwzpdjb record, @Param("example") ZjDwzpdjbExample example);

    int updateByPrimaryKeySelective(ZjDwzpdjb record);

    int updateByPrimaryKey(ZjDwzpdjb record);
    
    void updateDj(ZjDwzpdjb zjDwzpdjb);
    
}