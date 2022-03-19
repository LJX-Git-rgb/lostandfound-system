package team.system.lostandfoundserver.domain;
import lombok.Data;

import java.util.List;

/**
 * @ClassName: PageHelper
 * @Description:
 * @Author: Jason
 * @Date: 2022/2/18 1:53 下午
 * @Version: 1.0
 */

@Data
public class PageHelper {
    private List<User> users;
    private Integer total;
    private Integer currentPage;
}
