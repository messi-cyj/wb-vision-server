<template>

  <div id="container" style="width: 99.8%; height: calc(100vh - 88px);z-index: 100">
    <div class="main">
      <div class="no-bottom" style="z-index: 99;top:60px;padding-top: 280px;padding-left: 10px;border-width:10px;margin: 10px">
        <button class="button" @click="returnLocation">
        </button>
      </div>
    </div>



    <!--    面形编辑-->
    <div class="input-card" style="z-index: 99;margin-bottom: 130px;">
      <button class="btn" onclick="createPolygon()" style="border: none;">新建</button>

    </div>



  </div>






</template>


<style>
.main {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: absolute;
  right: 0;
  bottom: -15px;

}

.no-bottom {
  display: flex;
  align-items: flex-end;
  justify-content: flex-end;
  width: 10px;
//height: 50px;
  transform: scale(0.5);
  background-color: rgba(255,255,255,0);
}
.button {
  cursor: pointer;
  background-position: center;
  background-image: url("G:/MyProject/wb-vision-server/ruoyi-ui/src/assets/icons/png/position.png");
  background-size: 45px 45px;
  background-repeat: no-repeat;
  font-size: 50px;
  padding: 35px 35px; /* 设置按钮的内边距为10像素和20像素 */
  border: none;
}
.input-card{
  width: 35px;
  height: 35px;
  margin-right: 3px;
  border-color: black;
  border-width: 3px;
}
.btn{
  border: none;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
 width: 100%;
 height: 100%;
  color: black;
}
.card{
  border: none;
  writing-mode: horizontal-tb;
}





</style>

<script>

import AMap from "AMap"





let content = [
  "<div style='font-size: 14px; color: blue; width: 200px; height: 50px'>巨源科技</div>"
];
//获取当前位置
export default {
  data() {
    return {
      map: "",
      marker1: "",

    }
  },
  created() {


  },
  mounted() {
    this.getLocation();
    this.createdMap();


  },
  name: "AMap",
  methods:
    {
      //创建地图实例
      createdMap() {
        this.map = new AMap.Map("container", {
          viewMode: '3D',   //默认使用2D模式
          zoom: 12,
          center: [104.07078346008302, 30.57424885192265],
        });

        const traffic = new AMap.TileLayer.Traffic({
          'autoRefresh': true,     //是否自动刷新，默认为false
          'interval': 60,         //刷新间隔，默认180s
        });

        //通过add方法添加图层
        this.map.add(traffic);


        //工具条
        this.toolbar = new AMap.ToolBar({
          position: 'RB',
        });
        this.map.addControl(this.toolbar);

        //比例尺
        this.scale = new AMap.Scale();
        this.map.addControl(this.scale);

        //工具条方向盘
        this.controlBar = new AMap.ControlBar();
        this.map.addControl(this.controlBar);



      },
      //自动获取ip地址
      getLocation() {
        let _this = this
        AMap.plugin('AMap.Geolocation', function () {
          let geolocation = new AMap.Geolocation({
            enableHighAccuracy: true,//是否使用高精度定位，默认:true
            timeout: 10000,          //超过10秒后停止定位，默认：5s
            buttonPosition: 'RB',    //定位按钮的停靠位置
            buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
            zoomToAccuracy: true,   //定位成功后是否自动调整地图视野到定位点
          });
          geolocation.getCurrentPosition(function (status, result) {
            if (status === 'complete') {
              console.log(result)
              // map.add(result.position.pos[0],result.position.pos[1])
              _this.marker1 = new AMap.Marker({
                position: new AMap.LngLat(result.position.lng, result.position.lat),
                title: '巨源科技'
              })
              _this.map.add(_this.marker1)
              _this.map.setCenter([result.position.lng, result.position.lat])
            } else {
              console.log(result)
            }
          });
        });
      },

//返回IP地址中心点
    returnLocation() {
      console.log(this.marker1)
      this.map.setCenter([this.marker1._position.lng, this.marker1._position.lat])
    },




  }

}

</script>
