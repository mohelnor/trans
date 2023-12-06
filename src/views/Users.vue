<script setup>
import MyMenu from "../components/Menu.vue"
import DemoGrid from '../components/Grid.vue'
import Modal from '../components/Modal.vue'
import { ref, reactive, onMounted } from 'vue'

let headersList = {
  Accept: '*/*',
  'Content-Type': 'application/json'
}

const showModal = ref(false)

const searchQuery = ref('')
const gridColumns = ['id', 'user', 'name', 'password', 'role', 'created']
const gridColumnsAr = ['#', 'المستخدم', 'الاسم', 'كلمة السر', 'الدور', 'تاريخ الإنشاء']
const gridData = reactive([])
const isAdd = ref(true)
const id = ref(0)
const user = ref('')
const name = ref('')
const password = ref('')
const role = 'client'

async function fetchUsers() {
  let bodyContent = JSON.stringify({ "table": "users" })

  let response = await fetch('http://localhost/manara/api/crud/select/', {
    method: 'POST',
    body: bodyContent,
    headers: headersList
  })

  let data = await response.json()
  if (data.res.length > 0) {
    gridData.values = await data.res
  }
}
onMounted(async () => {
  fetchUsers()
  user.value = localStorage.getItem('id')
})

async function save() {
  let saved = true

  try {

    let bodyContent = JSON.stringify({
      "table": "users",
      "data": {
        "user": user.value,
        "name": name.value,
        "password": password.value,
        "role": role
      }
    })

    let response = await fetch("http://localhost/manara/api/crud/insert/", {
      method: "POST",
      body: bodyContent,
      headers: headersList
    })

    let data = await response.text()

    if (data) {
      reset()
      fetchUsers()
    }

  } catch (e) {
    // log error
    error.value = "Some Error Message";
  }
}

function reset() {
  showModal.value = false
  id.value = 0
  user.value = name.value = password.value = ''
  isAdd.value = true
}

function editUser(myUser) {
  isAdd.value = false
  id.value = myUser.id
  user.value = myUser.user
  name.value = myUser.name
  password.value = myUser.password
  showModal.value = true
}

async function saveEdit() {
  let saved = true

  try {

    let bodyContent = JSON.stringify({
      "table": "users",
      "id": id.value,
      "data": {
        "user": user.value,
        "name": name.value,
        "password": password.value,
        "role": role
      }
    })

    let response = await fetch("http://localhost/manara/api/crud/update/", {
      method: "POST",
      body: bodyContent,
      headers: headersList
    })

    let data = await response.text()

    if (data) {
      reset()
      fetchUsers()
    }

  } catch (e) {
    // log error
    error.value = "Some Error Message";
  }
}

async function deleteUser(myUser) {
  var ok = confirm('هل تريد مسح ' + myUser.name)
  if (ok) {
    let saved = true

    try {

      let bodyContent = JSON.stringify({
        "table": "users",
        "id": myUser.id
      })

      let response = await fetch("http://localhost/manara/api/crud/delete/", {
        method: "POST",
        body: bodyContent,
        headers: headersList
      })

      let data = await response.text()

      if (data) {
        reset()
        fetchUsers()
      }

    } catch (e) {
      console.log(e)
    }
  }
}
</script>
<template>
  <header>
    <div class="card">
      <MyMenu class="shadow-1 p-0 m-0" />
    </div>
  </header>
  <main class="container p-2">
    <form id="search" class="form d-inline">
      <input class="form-control w-50 d-inline" name="query" v-model="searchQuery" placeholder="بحث">
    </form>
    <button id="show-modal" @click.prevent="showModal = true" class="btn btn-success float-start">جديد</button>
    <DemoGrid :data="gridData.values" :columns="gridColumns" :columnsAr="gridColumnsAr" :filter-key="searchQuery" @del="deleteUser" @edit="editUser">
    </DemoGrid>

    <Teleport to="body">
      <!-- use the modal component, pass in the prop -->
      <modal :show="showModal" @close="showModal = false" @backdrop="showModal = false">
        <template #header>
          <div class="text-center">
            <h3>بيانات المستخدم</h3>
          </div>
        </template>
        <template #body>
          <form class="form">
            <input class="form-control w-100 my-1" type="text" name="user" v-model="user" placeholder="المستخدم">
            <input class="form-control w-100 my-1" type="text" name="name" v-model="name" placeholder="اسم الكامل">
            <input class="form-control w-100 my-1" type="password" name="password" v-model="password"
              placeholder="كلمة السر">
            <button v-show="isAdd" type="submit" class="btn btn-success rounded-0 w-50 my-1"
              @click.prevent="save">حفظ</button>
            <button v-show="!isAdd" type="submit" class="btn btn-info rounded-0 w-50 my-1"
              @click.prevent="saveEdit">تعديل</button>
            <button type="reset" class="btn btn-danger rounded-0 w-50 my-1" @click.prevent="reset">إلغاء</button>
          </form>
        </template>
      </modal>
    </Teleport>

  </main>
</template>	
<style scoped></style>