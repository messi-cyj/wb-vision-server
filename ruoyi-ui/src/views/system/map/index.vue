
<template>
  <div id="container" style="width: 99.8%; height: calc(100vh - 88px);z-index: auto">
    <div class="main">
      <div class="no-bottom" style="z-index: 1;top:60px;padding-top: 280px;padding-left: 10px;border-width:10px;margin: 10px">
        <button class="button" @click="returnLocation">
        </button>
      </div>
    </div>









      <div class="info" style="z-index: 99; top: 100px">
        <p>待开发</p>
      </div>
    </div>

<!--  </div>-->
</template>


<script>

import AMap from "AMap";



let content = [
  "<div style='font-size: 14px; color: blue; width: 200px; height: 50px'>巨源科技</div>"
];


//获取当前位置
export default {
  data() {
    return {
      map: "",
      marker1:"",

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
          zoom: 15,
          center: [104.07078346008302, 30.57424885192265],
        })

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



        //创建区域
        // var path1 = [[104.04051741355897, 30.66617092170566], [104.0374248265648, 30.667545950457814], [104.03208991283418, 30.66851491869663], [104.0331198810959, 30.673221197628028], [104.03567334407808,30.67266752965043],[104.03778156036378, 30.67198466811501], [104.03832336658479, 30.67301818640633], [104.04031893009187, 30.672409150177455]];
        // var polygon1 = new AMap.Polygon({
        //   path: path1
        // });
        // this.map.add(polygon1);

        // 测量距离
        // var ruler2 = new AMap.RangingTool(this.map,{
        //   startLabelText:"开始",
        //   midLabelText:"经过",
        //   endLabelText:"结束"
        // });
        // ruler2.turnOn(); //开启绘制
        //
        // AMap.Event.addListener(ruler2,"end",function(e){
        //   console.log(e.points) //绘制测量工具点结束的数据
        //   ruler2.turnOff()  //关闭绘制
        //     // ps:如果遇到AMap.Event报错，先打印AMap，观察下面的参数
        //     AMap.Event.addListener(ruler2,"remove-node",function(e){
        //       console.log(e.distance) //删除一段节点返回的数据
        // });
        // });










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

<style>
.main {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: absolute;
  right: 0;
  bottom: -15px;

}
.info{
  width: 70px;
  height: 200px;
}

.no-bottom {
  display: flex;
  align-items: flex-end;
  justify-content: flex-end;
  width: 10px;
//height: 50px;
  transform: scale(0.5);
  background-color: rgba(255,255,255,0);
  border: none;
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
.dropdown {
  position: relative;
//display: inline-block;
  width: 100%;
  height: 100%;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
//min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  margin-top: 0px;
  z-index: 1;
}

.dropdown:hover .dropdown-content {
  display: block;
}
.input-card{
  width: 55px;
  hight:10px;
  writing-mode: horizontal-tb
}
.btn{
  margin: 2px;
  z-index: 1;
}


</style>
