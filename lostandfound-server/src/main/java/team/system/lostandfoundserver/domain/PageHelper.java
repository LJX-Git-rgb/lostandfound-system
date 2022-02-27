package team.system.lostandfoundserver.domain;
import java.util.List;

/**
 * @ClassName: PageHelper
 * @Description:
 * @Author: Jason
 * @Date: 2022/2/18 1:53 下午
 * @Version: 1.0
 */
public class PageHelper {
    private List<User> users;
    private Integer total;
    private Integer currentPage;

    public PageHelper() {
    }

    public PageHelper(List<User> users, Integer total, Integer currentPage) {
        this.users = users;
        this.total = total;
        this.currentPage = currentPage;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }
}
