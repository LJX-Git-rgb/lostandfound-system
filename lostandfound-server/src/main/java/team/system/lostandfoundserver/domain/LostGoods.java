package team.system.lostandfoundserver.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.util.Date;

@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LostGoods extends Goods{
  @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
  private Date LostTime;
  private String LostArea;
}
