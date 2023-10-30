<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入名称"
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
          v-hasPermi="['system:record:add']"
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
          v-hasPermi="['system:record:edit']"
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
          v-hasPermi="['system:record:remove']"
        >删除</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:record:export']"
        >导出</el-button> -->
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="recordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="名称" align="center" prop="name" />
      <el-table-column label="学院" align="center" prop="academyName" />
      <el-table-column label="专业" align="center" prop="majorName" />
      <el-table-column label="年级" align="center" prop="gradeName" />
      <el-table-column label="班级" align="center" prop="className" />
      <el-table-column label="课程" align="center" prop="courseName" />
      <el-table-column label="教师" align="center" prop="teacherName" />
      <el-table-column label="教室" align="center" prop="classroomName" />
      <el-table-column label="课次" align="center" prop="times" />
      <el-table-column label="课程秒数" align="center" prop="duration" />
      <el-table-column label="状态" align="center" prop="status" >
         <template slot-scope="scope">
          <span v-if="scope.row.status==0">未开始</span>
          <span v-if="scope.row.status==1">进行中</span>
          <span v-if="scope.row.status==2">完成</span>
          <span v-if="scope.row.status==3">取消</span>
        </template>
      </el-table-column>
      <el-table-column label="开始时间" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="创建人" align="center" prop="createUserId" />
      <el-table-column label="更新人" align="center" prop="updateUserId" /> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.status == 0"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:record:edit']"
          >修改</el-button>
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:record:remove']"
          >删除</el-button> -->
          <el-button
            v-if="scope.row.status < 2"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleCancel(scope.row)"
            v-hasPermi="['system:record:edit']"
          >取消</el-button>
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

    <!-- 添加或修改教学记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="学院" prop="academyId">
          <el-select v-model="form.academyId" placeholder="请选择学院" clearable @change="handleAcademyChange">
              <el-option
                v-for="item in academyList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
        <el-form-item label="专业" prop="majorId">
          <el-select v-model="form.majorId" placeholder="请选择专业" clearable @change="handleMajorChange">
              <el-option
                v-for="item in majorList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
        <el-form-item label="年级" prop="gradeId">
          <el-select v-model="form.gradeId" placeholder="请选择年级" clearable >
              <el-option
                v-for="item in gradeList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
        <el-form-item label="班级" prop="classId">
          <el-select v-model="form.classId" placeholder="请选择班级" clearable @change="handleClassChange">
              <el-option
                v-for="item in classList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
        <el-form-item label="课程" prop="courseId">
          <el-select v-model="form.courseId" placeholder="请选择课程" clearable >
              <el-option
                v-for="item in courseList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
        <el-form-item label="教师" prop="teacherId">
          <el-select v-model="form.teacherId" placeholder="请选择教师" clearable>
              <el-option
                v-for="item in teacherList"
                :key="item.id"
                :label="item.name"
                :value="item.userId"
              />
          </el-select>
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
        <el-form-item label="课次" prop="times">
          <el-input-number :min="1" v-model="form.times" placeholder="请输入课次" />
        </el-form-item>
        <el-form-item label="课程秒数" prop="duration">
          <el-input-number :min="0" v-model="form.duration" placeholder="请输入课程秒数" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRecord, getRecord, delRecord, addRecord, updateRecord } from "@/api/system/teachingRecord";
import { listMajor, getMajor, delMajor, addMajor, updateMajor } from "@/api/system/major";
import { listAcademy, getAcademy, delAcademy, addAcademy, updateAcademy } from "@/api/system/academy";
import { listGrade, getGrade, delGrade, addGrade, updateGrade } from "@/api/system/grade";
import { listClass, getClass, delClass, addClass, updateClass } from "@/api/system/class";
import { listClassroom } from "@/api/system/classroom";
import { listCourse, getCourse, delCourse, addCourse, updateCourse } from "@/api/system/course";
import { listMember } from "@/api/system/member";

export default {
  name: "Record",
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
      // 教学记录表格数据
      recordList: [],
      academyList: [],
      majorList: [],
      gradeList: [],
      classList: [],
      courseList: [],
      teacherList: [],
      classroomList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        academyId: null,
        majorId: null,
        gradeId: null,
        classId: null,
        courseId: null,
        teacherId: null,
        times: null,
        duration: null,
        status: null,
        startTime: null,
        endTime: null,
        createUserId: null,
        updateUserId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "名称不能为空", trigger: "blur" }
        ],
        academyId: [
          { required: true, message: "学院不能为空", trigger: "blur" }
        ],
        majorId: [
          { required: true, message: "专业不能为空", trigger: "blur" }
        ],
        gradeId: [
          { required: true, message: "年级不能为空", trigger: "blur" }
        ],
        classId: [
          { required: true, message: "班级不能为空", trigger: "blur" }
        ],
        courseId: [
          { required: true, message: "课程不能为空", trigger: "blur" }
        ],
        teacherId: [
          { required: true, message: "教师不能为空", trigger: "blur" }
        ],
        classroomId: [
          { required: true, message: "教室不能为空", trigger: "blur" }
        ],
        times: [
          { required: true, message: "课次不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询教学记录列表 */
    getList() {
      this.loading = true;
      listRecord(this.queryParams).then(response => {
        this.recordList = response.rows;
        this.total = response.total;
        this.loading = false;
      });

      listAcademy({pageSize: 100}).then(response => {
        this.academyList = response.rows;
      });

      listMajor({pageSize: 100}).then(response => {
        this.majorList = response.rows;
      });

      listGrade({pageSize: 100}).then(response => {
        this.gradeList = response.rows;
      });

      listClass({pageSize: 100}).then(response => {
        this.classList = response.rows;
      });

      listCourse({pageSize: 100}).then(response => {
        this.courseList = response.rows;
      });

      listMember({pageSize: 100, userType: 1}).then(response => {
        this.teacherList = response.rows;
      });

      listClassroom({pageSize: 100}).then(response => {
        this.classroomList = response.rows;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        academyId: null,
        majorId: null,
        gradeId: null,
        classId: null,
        courseId: null,
        teacherId: null,
        times: null,
        duration: null,
        status: 0,
        startTime: null,
        endTime: null,
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
      this.title = "添加教学记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getRecord(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改教学记录";
      });
    },
    handleAcademyChange(val) {
      listMajor({academyId: val}).then(response => {
        this.majorList = response.rows;
      });
    },
    handleMajorChange(val) {
      listClass({majorId: val}).then(response => {
        this.classList = response.rows;
      });
    },
    handleClassChange(val) {
      listCourse({classId: val}).then(response => {
        this.courseList = response.rows;
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateRecord(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRecord(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    handleCancel(row) {
      this.$modal.confirm('取消后教学将不可用，请确认没有该次教学正在进行，再取消。确认该操作吗？').then(function() {
        return updateRecord({
          id: row.id,
          status: 3
        });
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("取消成功");
      }).catch(() => {});
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除教学记录编号为"' + ids + '"的数据项？').then(function() {
        return delRecord(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/record/export', {
        ...this.queryParams
      }, `record_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
