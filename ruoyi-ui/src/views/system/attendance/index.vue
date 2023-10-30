<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-row>
        <el-form-item label="学院" prop="academyId">
          <el-select v-model="queryParams.academyId" placeholder="请选择学院" clearable>
                <el-option
                  v-for="item in academyList"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id"
                />
            </el-select>
        </el-form-item>
        <el-form-item label="年级" prop="gradeId">
          <el-select v-model="queryParams.gradeId" placeholder="请选择年级" clearable>
                <el-option
                  v-for="item in gradeList"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id"
                />
            </el-select>
        </el-form-item>
        <el-form-item label="专业" prop="majorId">
          <el-select v-model="queryParams.majorId" placeholder="请选择专业" clearable>
                <el-option
                  v-for="item in majorList"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id"
                />
            </el-select>
        </el-form-item>
      </el-row>
      <el-row>
        <el-form-item label="班级" prop="classId">
          <el-select v-model="queryParams.classId" placeholder="请选择班级" clearable>
                <el-option
                  v-for="item in classList"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id"
                />
            </el-select>
        </el-form-item>
        <el-form-item label="课程" prop="courseId">
          <el-select v-model="queryParams.courseId" placeholder="请选择课程" clearable>
                <el-option
                  v-for="item in courseList"
                  :key="item.id"
                  :label="item.name"
                  :value="item.id"
                />
            </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-row>
    </el-form>

    <!-- <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:attendance:add']"
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
          v-hasPermi="['system:attendance:edit']"
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
          v-hasPermi="['system:attendance:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:attendance:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row> -->

    <el-table v-loading="loading" :data="attendanceList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="学生" align="center" prop="studentName" />
      <el-table-column label="签到时间" align="center" prop="createTime" />
      <el-table-column label="学院" align="center" prop="academyName" />
      <el-table-column label="专业" align="center" prop="majorName" />
      <el-table-column label="班级" align="center" prop="className" />
      <el-table-column label="课程" align="center" prop="courseName" />
      <el-table-column label="教学记录" align="center" prop="teachingRecordName" />
      <el-table-column label="教室" align="center" prop="classroomName" />
      <el-table-column label="桌子" align="center" prop="deskName" />
      <!-- <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:attendance:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:attendance:remove']"
          >删除</el-button>
        </template>
      </el-table-column> -->
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改考勤对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="学院ID" prop="academyId">
          <el-input v-model="form.academyId" placeholder="请输入学院ID" />
        </el-form-item>
        <el-form-item label="专业ID" prop="majorId">
          <el-input v-model="form.majorId" placeholder="请输入专业ID" />
        </el-form-item>
        <el-form-item label="班级ID" prop="classId">
          <el-input v-model="form.classId" placeholder="请输入班级ID" />
        </el-form-item>
        <el-form-item label="课程ID" prop="courseId">
          <el-input v-model="form.courseId" placeholder="请输入课程ID" />
        </el-form-item>
        <el-form-item label="教学记录ID" prop="teachingRecordId">
          <el-input v-model="form.teachingRecordId" placeholder="请输入教学记录ID" />
        </el-form-item>
        <el-form-item label="教室ID" prop="classroomId">
          <el-input v-model="form.classroomId" placeholder="请输入教室ID" />
        </el-form-item>
        <el-form-item label="桌子ID" prop="deskId">
          <el-input v-model="form.deskId" placeholder="请输入桌子ID" />
        </el-form-item>
        <el-form-item label="学生ID" prop="studentId">
          <el-input v-model="form.studentId" placeholder="请输入学生ID" />
        </el-form-item>
        <el-form-item label="创建人" prop="createUserId">
          <el-input v-model="form.createUserId" placeholder="请输入创建人" />
        </el-form-item>
        <el-form-item label="更新人" prop="updateUserId">
          <el-input v-model="form.updateUserId" placeholder="请输入更新人" />
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
import { listAttendance, getAttendance, delAttendance, addAttendance, updateAttendance } from "@/api/system/attendance";
import { listMajor, getMajor, delMajor, addMajor, updateMajor } from "@/api/system/major";
import { listAcademy, getAcademy, delAcademy, addAcademy, updateAcademy } from "@/api/system/academy";
import { listGrade, getGrade, delGrade, addGrade, updateGrade } from "@/api/system/grade";
import { listClass, getClass, delClass, addClass, updateClass } from "@/api/system/class";
import { listClassroom } from "@/api/system/classroom";
import { listCourse, getCourse, delCourse, addCourse, updateCourse } from "@/api/system/course";
import { listMember } from "@/api/system/member";

export default {
  name: "Attendance",
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
      // 考勤表格数据
      attendanceList: [],
      academyList: [],
      majorList: [],
      gradeList: [],
      classList: [],
      courseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        academyId: null,
        majorId: null,
        classId: null,
        courseId: null,
        teachingRecordId: null,
        classroomId: null,
        deskId: null,
        studentId: null,
        createUserId: null,
        updateUserId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
    this.fetchData();
  },
  methods: {
    /** 查询考勤列表 */
    getList() {
      this.loading = true;
      listAttendance(this.queryParams).then(response => {
        this.attendanceList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    fetchData() {
      listAcademy({pageSize: 100}).then(response => {
        this.academyList = response.rows;
      });

      listGrade({pageSize: 100}).then(response => {
        this.gradeList = response.rows;
      });

      listMajor({pageSize: 100}).then(response => {
        this.majorList = response.rows;
      });

      listClass({pageSize: 100}).then(response => {
        this.classList = response.rows;
      });

      listCourse({pageSize: 100}).then(response => {
        this.courseList = response.rows;
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
        academyId: null,
        majorId: null,
        classId: null,
        courseId: null,
        teachingRecordId: null,
        classroomId: null,
        deskId: null,
        studentId: null,
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
      this.title = "添加考勤";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAttendance(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改考勤";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateAttendance(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAttendance(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除考勤编号为"' + ids + '"的数据项？').then(function() {
        return delAttendance(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/attendance/export', {
        ...this.queryParams
      }, `attendance_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
