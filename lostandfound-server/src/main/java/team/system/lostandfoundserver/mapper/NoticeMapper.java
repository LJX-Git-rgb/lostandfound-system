package team.system.lostandfoundserver.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;
import team.system.lostandfoundserver.domain.Notice;

public interface NoticeMapper extends BaseMapper<Notice> {

    @Select("select * from notice where id = #{id}")
    Notice searchById(Integer id);
}
