<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户ID" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入账号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号" prop="mobile">
        <el-input
          v-model="queryParams.mobile"
          placeholder="请输入手机号"
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
          v-hasPermi="['system:member:add']"
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
          v-hasPermi="['system:member:edit']"
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
          v-hasPermi="['system:member:remove']"
        >删除</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:member:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="memberList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="账号" align="center" prop="userId" />
      <el-table-column label="名称" align="center" prop="name" />
      <!-- <el-table-column label="密码" align="center" prop="password" /> -->
      <!-- <el-table-column label="手机号" align="center" prop="mobile" /> -->
      <!-- <el-table-column label="邮箱" align="center" prop="email" /> -->
      <!-- <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <span>{{scope.row.status == 1 ? '启用' : '冻结'}}</span>
        </template>
      </el-table-column> -->
      <el-table-column label="学校" align="center" prop="schoolName" />
      <el-table-column label="学院" align="center" prop="academyName" />
      <el-table-column label="年级" align="center" prop="gradeName" />
      <el-table-column label="专业" align="center" prop="majorName" />
      <el-table-column label="班级" align="center" prop="className" />
      <!-- <el-table-column label="人脸图片" align="center" prop="faceResourceId" /> -->
      <el-table-column label="头像地址" align="center" prop="avatar" >
        <template slot-scope="scope">
          <img v-if="scope.row.avatar" :src="scope.row.avatar" width="48" height="48" />
        </template>
      </el-table-column>
      <el-table-column label="用户类型" align="center" prop="userType">
        <template slot-scope="scope">
          <span>{{scope.row.userType == 1 ? '老师' : '学生'}}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="创建人" align="center" prop="createUserId" />
      <el-table-column label="更新人" align="center" prop="updateUserId" /> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:member:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-key"
            @click="handlePwd(scope.row)"
            v-hasPermi="['system:member:edit']"
          >重置密码</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:member:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <el-dialog :visible.sync="dialogVisible">
      <img width="100%" :src="dialogImageUrl" alt="">
    </el-dialog>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改用户对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="账号" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入账号" />
        </el-form-item>
        <el-form-item label="名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="密码" prop="name" v-if="!form.id">
          <el-input v-model="form.password" placeholder="请输入密码" />
        </el-form-item>
        <el-form-item label="学校" prop="schoolId">
          <el-select v-model="form.schoolId" placeholder="请选择学校" clearable>
              <el-option
                v-for="item in schoolList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
        <el-form-item label="学院" prop="academyId">
          <el-select v-model="form.academyId" placeholder="请选择学院" clearable>
              <el-option
                v-for="item in academyList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
        <el-form-item label="专业" prop="majorId">
          <el-select v-model="form.majorId" placeholder="请选择专业" clearable>
              <el-option
                v-for="item in majorList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
         <el-form-item label="年级" prop="gradeId">
          <el-select v-model="form.gradeId" placeholder="请选择年级" clearable>
              <el-option
                v-for="item in gradeList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
        <el-form-item label="班级" prop="classId">
          <el-select v-model="form.classId" placeholder="请选择班级" clearable>
              <el-option
                v-for="item in classList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              />
          </el-select>
        </el-form-item>
         <el-form-item label="人员类型" prop="userType">
          <el-radio-group v-model="form.userType">
            <el-radio :label="1">老师</el-radio>
            <el-radio :label="2">学生</el-radio>
          </el-radio-group>
        </el-form-item>
         <el-form-item label="手机号" prop="mobile">
          <el-input v-model="form.mobile" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="身份证号" prop="identificationNumber">
          <el-input v-model="form.identificationNumber" placeholder="请输入身份证号" />
        </el-form-item>
        <el-form-item label="出生日期" prop="birthday">
          <el-input v-model="form.birthday" placeholder="请输入出生日期" />
        </el-form-item>
        <el-form-item label="头像地址" prop="avatar">
          <el-upload
            list-type="picture-card"
            :class="{hide:hideUpload}"
            :action="upload.url"
            :headers="upload.headers"
            :file-list="upload.fileList"
            :show-file-list="true"
            :on-change="handleChange"
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload">
              <i class="el-icon-plus avatar-uploader-icon" ></i>
          </el-upload>
        </el-form-item>
        <!-- <el-form-item label="人脸图片" prop="faceResourceId">
          <el-input v-model="form.faceResourceId" placeholder="请输入人脸图片ID" />
        </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog title="修改密码" :visible.sync="pwdOpen" width="500px" append-to-body>
      <el-form ref="pwdForm" :rules="pwdRules" :model="pwdForm" label-width="80px">
        <el-form-item label="密码" prop="password">
          <el-input type='password' v-model="pwdForm.password" placeholder="请输入密码" />
        </el-form-item>
        <el-form-item label="确认密码" prop="confirmPassword">
          <el-input type='password' v-model="pwdForm.confirmPassword" placeholder="请再次确认密码" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitPwd">确 定</el-button>
        <el-button @click="pwdOpen = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listMember, getMember, delMember, addMember, updateMember, updateMemberPwd } from "@/api/system/member";
import { listSchool } from "@/api/system/school";
import { listMajor, getMajor, delMajor, addMajor, updateMajor } from "@/api/system/major";
import { listAcademy, getAcademy, delAcademy, addAcademy, updateAcademy } from "@/api/system/academy";
import { listGrade, getGrade, delGrade, addGrade, updateGrade } from "@/api/system/grade";
import { listClass, getClass, delClass, addClass, updateClass } from "@/api/system/class";
import { listCourse, getCourse, delCourse, addCourse, updateCourse } from "@/api/system/course";
import { getToken } from "@/utils/auth";

export default {
  name: "Member",
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
      dialogImageUrl: '',
      dialogVisible: false,
      // 总条数
      total: 0,
      // 用户表格数据
      memberList: [],
      schoolList: [],
      academyList: [],
      majorList: [],
      gradeList: [],
      classList: [],
      hideUpload: false,
      upload: {
        url: process.env.VUE_APP_BASE_API + '/common/upload',
        headers: { Authorization: "Bearer " + getToken() },
        fileList: []
      },
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      pwdOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        name: null,
        password: null,
        mobile: null,
        email: null,
        status: null,
        schoolId: null,
        academyId: null,
        majorId: null,
        classId: null,
        faceResourceId: null,
        userType: null,
        createUserId: null,
        updateUserId: null
      },
      // 表单参数
      form: {
        userType: 1
      },
      pwdForm: {
        password: '',
        confirmPassword: ''
      },
      // 表单校验
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户账号不能为空", trigger: "blur" },
          { min: 2, max: 20, message: '用户账号长度必须介于 2 和 20 之间', trigger: 'blur' }
        ],
        name: [
          { required: true, message: "用户姓名不能为空", trigger: "blur" }
        ],
        schoolId: [
          { required: true, message: "学校不能为空", trigger: "blur" }
        ],
        academyId: [
          { required: true, message: "学院不能为空", trigger: "blur" }
        ],
        gradeId: [
          { required: true, message: "年级不能为空", trigger: "blur" }
        ],
        majorId: [
          { required: true, message: "专业不能为空", trigger: "blur" }
        ],
        classId: [
          { required: true, message: "班级不能为空", trigger: "blur" }
        ],
        userType: [
          { required: true, message: "用户类型不能为空", trigger: "blur" }
        ],
      },
      pwdRules: {
        password: [
          { required: true, message: "密码不能为空", trigger: "blur" },
          { min: 5, max: 20, message: '密码长度必须介于 5 和 20 之间', trigger: 'blur' }
        ],
        confirmPassword: [
          { required: true, message: "确认密码不能为空", trigger: "blur" },
          { min: 5, max: 20, message: '确认密码长度必须介于 5 和 20 之间', trigger: 'blur' }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询用户列表 */
    getList() {
      this.loading = true;
      listMember(this.queryParams).then(response => {
        this.memberList = response.rows;
        this.total = response.total;
        this.loading = false;
      });

      listSchool({pageSize: 100}).then(response => {
        this.schoolList = response.rows;
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
    },
    handleRemove(file, fileList) {
        this.hideUpload = fileList.length >= 1;
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
    handleChange(file, fileList) {
      this.hideUpload = fileList.length >= 1;
    },
    handleAvatarSuccess(res, file) {
      this.form.avatar = res.url
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 < 100;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 100KB!');
      }
      return isJPG && isLt2M;
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
        userId: null,
        name: null,
        password: null,
        mobile: null,
        email: null,
        status: 0,
        schoolId: null,
        academyId: null,
        majorId: null,
        classId: null,
        faceResourceId: null,
        userType: 2,
        createTime: null,
        updateTime: null,
        createUserId: null,
        updateUserId: null
      };
      this.upload.fileList = [];
      this.hideUpload = false;
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
      this.title = "添加用户";
    },
    handlePwd(row) {
      this.pwdForm = {};
      const id = row.id;
      this.pwdForm.id = id;
      this.pwdOpen = true;
    },
    submitPwd() {
      this.$refs['pwdForm'].validate(valid => {
        if (this.pwdForm.password != this.pwdForm.confirmPassword) {
          this.$modal.msgWarning("两次密码不一致");
          return;
        }
        if (valid) {
          updateMemberPwd(this.pwdForm.id, this.pwdForm.password).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.pwdOpen = false;
            this.getList();
          });
        }
      })
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getMember(id).then(response => {
        this.form = response.data;
        this.form.password = '';
        if (response.data.avatar) {
          this.hideUpload = true;
          this.upload.fileList = [{
            name: response.data.avatar,
            url: response.data.avatar,
          }]
        }
        this.open = true;
        this.title = "修改用户";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateMember(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            if (!this.form.password) {
              this.$modal.msgWarning("请输入密码");
              return;
            }
            addMember(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除用户编号为"' + ids + '"的数据项？').then(function() {
        return delMember(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/member/export', {
        ...this.queryParams
      }, `member_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

<style scoped>
.avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 64px;
    height: 64px;
    line-height: 64px;
    text-align: center;
  }
  .avatar {
    width: 64px;
    height: 64px;
    display: block;
  }
</style>

<style>
.hide .el-upload--picture-card {
    display: none;
}
</style>
