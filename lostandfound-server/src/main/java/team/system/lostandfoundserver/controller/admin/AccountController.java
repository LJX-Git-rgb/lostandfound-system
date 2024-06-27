package team.system.lostandfoundserver.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team.system.lostandfoundserver.domain.User;
import team.system.lostandfoundserver.service.impl.UserServiceImpl;

import java.util.List;

@RestController
@RequestMapping("/account")
public class AccountController {

  @Autowired
  private UserServiceImpl userService;

  @RequestMapping("/findAll")
  public List<User> findAll(Integer currentPage, Integer pageSize) {
    if (currentPage > 0) {
      currentPage--;
    }
    return userService.findUserByPage(currentPage, pageSize);
  }

  @RequestMapping("/countUser")
  public Integer countUser() {
    return userService.countUser();
  }
}
