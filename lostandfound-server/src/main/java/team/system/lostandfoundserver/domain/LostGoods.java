package team.system.lostandfoundserver.domain;

import lombok.Data;

import java.util.Date;

@Data
public class LostGoods {

  private Integer id;
  private String title;
  private String description;
  private String image;
  private String tag;
  private Integer state;
  private Date createTime;
  private Date LostTime;
  private String LostArea;
  private Integer uid;
  private String[] imageList;
}
