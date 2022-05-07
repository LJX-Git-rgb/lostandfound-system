package team.system.lostandfoundserver.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class FindGoods {

  private Integer id;
  private String title;
  private String description;
  private String image;
  private String tag;
  private Integer state;
  @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
  private Date createTime;
  @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
  private Date foundTime;
  private String foundArea;
  private Integer uid;
  private String[] imageList;
}
