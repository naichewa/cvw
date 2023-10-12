#include "header.h"

int main(){
  //int res = icache_spill_test();
  oneLoopTest();
  global_hist_6_space_test();  
  global_hist_4_space_test();  
  global_hist_3_space_test();  
  global_hist_2_space_test();
  global_hist_1_space_test();
  global_hist_0_space_test();
  CBOMTest();
  int res = 1;
  if (res < 0) {
    fail();
    return 0;
  }else {
    if((res = lbu_test()) < 0) {
      fail();
      return 0;
    }
    res = simple_csrbr_test();
    return 0;
  }
}
