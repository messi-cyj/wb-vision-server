<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="桌子名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入桌子名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="桌子编号" prop="no">
        <el-input
          v-model="queryParams.no"
          placeholder="请输入桌子编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:desk:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:desk:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:desk:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:desk:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table ref="dataTable" v-loading="loading" :data="deskList" @selection-change="handleSelectionChange" @row-click="rowClick">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-table v-loading="loading" :data="props.row.deviceList" >
            <el-table-column label="设备编号" align="center" prop="no" />
            <el-table-column label="设备编号" align="center" prop="name" />
            <el-table-column label="类型" align="center" prop="type" >
              <template slot-scope="scope">
                <span v-if="scope.row.type == 'face'">人脸</span>
                <span v-if="scope.row.type == 'scene'">场景</span>
                <span v-if="scope.row.type == '360'">全景</span>
              </template>
            </el-table-column>
            <el-table-column label="ip" align="center" prop="ip" />
            <el-table-column label="port" align="center" prop="port" />
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
              <template slot-scope="scope">
                <el-popconfirm
                  title="确定解除绑定吗？"
                  @confirm="handleDeviceUnbind(props.row.classroomId, props.row.id, scope.row.id)"
                >
                  <el-button
                    slot="reference"
                    size="mini"
                    type="text"
                    icon="el-icon-delete"
                    v-hasPermi="['system:desk:edit']"
                  >解除绑定</el-button>
                </el-popconfirm>
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="桌子名称" align="center" prop="name" />
      <el-table-column label="桌子编号" align="center" prop="no" />
      <el-table-column label="教室名称" align="center" prop="classroomName" />
      <el-table-column label="教室编号" align="center" prop="classroomNo" />
      <el-table-column label="桌子类型" align="center" prop="type" >
        <template slot-scope="scope">
          <span>{{scope.row.type == 1 ? '老师':'学生'}}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="创建人" align="center" prop="createUserId" />
      <el-table-column label="更新人" align="center" prop="updateUserId" /> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleDeviceBind(scope.row)"
            v-hasPermi="['system:desk:edit']"
          >绑定设备</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:desk:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:desk:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改桌子对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="桌子名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入桌子名称" />
        </el-form-item>
        <el-form-item label="桌子编号" prop="no">
          <el-input v-model="form.no" placeholder="请输入桌子编号" />
        </el-form-item>
        <el-form-item label="教室" prop="classroomId">
          <el-select v-model="form.classroomId" placeholder="请选择教室" clearable>
              <el-option
                v-for="item in classroomList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
        <el-form-item label="桌子类型" prop="type">
          <el-radio-group v-model="form.type">
            <el-radio :label="1">教师桌子</el-radio>
            <el-radio :label="2">学生桌子</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog title="绑定设备" :visible.sync="bindOpen" width="500px" append-to-body>
      <el-form ref="bindForm" :model="bindForm" :rules="bindRules" label-width="80px">
        <el-form-item label="桌子" prop="deskName">
          <el-input v-model="bindForm.deskName" placeholder="请输入桌子名称" readonly/>
        </el-form-item>
        <el-form-item label="教室" prop="classroomName">
          <el-input v-model="bindForm.classroomName" placeholder="请输入桌子名称" readonly/>
        </el-form-item>
        <el-form-item label="设备" prop="deviceId">
          <el-select v-model="bindForm.deviceId" placeholder="请选择设备" clearable>
              <el-option
                v-for="item in deviceList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="confirmBind">确 定</el-button>
        <el-button @click="cancelBind">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listDesk, getDesk, delDesk, addDesk, updateDesk, bindDevice, unbindDevice } from "@/api/system/desk";
import { listDevice } from "@/api/system/device";
import { listClassroom, getClassroom, delClassroom, addClassroom, updateClassroom } from "@/api/system/classroom";

export default {
  name: "Desk",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 桌子表格数据
      deskList: [],
      classroomList:[],
      deviceList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      bindOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        no: null,
        classroomId: null,
        type: null,
        createUserId: null,
        updateUserId: null
      },
      // 表单参数
      form: {
        type: 1
      },
      bindForm: {

      },
      // 表单校验
      rules: {
        name: [
          { required: true, message: "名称不能为空", trigger: "blur" }
        ],
        no: [
          { required: true, message: "编号不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "类型不能为空", trigger: "blur" }
        ],
        classroomId: [
          { required: true, message: "教室不能为空", trigger: "blur" }
        ],
      },
      bindRules: {
        deviceId: [
          { required: true, message: "设备不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询桌子列表 */
    getList() {
      this.loading = true;
      listDesk(this.queryParams).then(response => {
        this.deskList = response.rows;
        this.total = response.total;
        this.loading = false;
      });

      listClassroom({pageSize: 100}).then(response => {
        this.classroomList = response.rows;
      });

      listDevice({pageSize: 100}).then(response => {
        this.deviceList = response.rows;
      })
    },
    rowClick(row, column, event) {
      this.$refs.dataTable.toggleRowExpansion(row)
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    cancelBind() {
      this.bindOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        no: null,
        classroomId: null,
        type: 1,
        createTime: null,
        updateTime: null,
        createUserId: null,
        updateUserId: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加桌子";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getDesk(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改桌子";
      });
    },
    handleDeviceBind(row) {
      this.bindForm.deskName = row.name;
      this.bindForm.classroomName = row.classroomName;
      this.bindForm.classroomId = row.classroomId;
      this.bindForm.deskId = row.id;
      this.bindOpen = true;
    },
    handleDeviceUnbind(classroomId, deskId, deviceId) {
      unbindDevice(classroomId, deskId, deviceId).then(resp => {
        this.$modal.msgSuccess("解绑成功");
        this.getList();
      });
    },
    confirmBind() {
      this.$refs['bindForm'].validate(valid => {
        if (valid) {
          bindDevice(this.bindForm.deskId, this.bindForm).then(response => {
            this.bindOpen = false;
            this.$modal.msgSuccess("绑定成功");
            this.getList();
          });
        }
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDesk(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDesk(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除桌子编号为"' + ids + '"的数据项？').then(function() {
        return delDesk(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/desk/export', {
        ...this.queryParams
      }, `desk_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
