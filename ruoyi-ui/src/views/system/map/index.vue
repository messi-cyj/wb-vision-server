<template>
  <div id="container" style="width: 100%; height: calc(100vh - 100px)">
    <div class="info" style="z-index: 1;top:680px;padding-top: 2px;right:5px;padding-left: 2px;border-width:2px">
      <button  @click="returnLocation"  style="padding-left: 230px;">点击我
      </button>

    </div>
  </div>

</template>
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
      marker1:"",
    }
  },
  created() {
    // this.createdMap();
    // this.getLocation();

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
          // buildingAnimation:True,
          // pitch:90,
          zoom: 12,
          center: [104.07078346008302, 30.57424885192265],
          resizeEnable: true
        });

        const traffic = new AMap.TileLayer.Traffic({
          'autoRefresh': true,     //是否自动刷新，默认为false
          'interval': 60,         //刷新间隔，默认180s
        });
        this.map.add(traffic); //通过add方法添加图层



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
              _this.map.setCenter([result.position.lng,result.position.lat])
            } else {
              console.log(result)
            }
          });
        });



      },



      //返回IP地址中心点
      returnLocation() {
        console.log(this.marker1)
        this.map.setCenter([this.marker1._position.lng,this.marker1._position.lat])
      }
    }

}

</script>







