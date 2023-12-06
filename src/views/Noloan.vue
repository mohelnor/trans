<script setup>
import MyMenu from "../components/Menu.vue";
import DemoGrid from '../components/Grid.vue'
import Modal from '../components/Modal.vue'
import { ref, reactive, onMounted } from 'vue'

let headersList = {
    Accept: '*/*',
    'Content-Type': 'application/json'
}

const searchQuery = ref('')
const gridColumns = [`id`, `city`, `price`, `remain`, `_value`, `total`, `required`, `price_txt`, `type`, `user`, `created`, `updated`]
const gridColumnsAr = [`#`, `المدينة`, `السعر`, `المتبقي`, `القيمة`, `الاجمالي`, `المطلوب`, `السعر مكتوب`, `النوع`, `الكاتب`, `ناريخ`, `التعديل`]
const gridData = reactive([])

const showModal = ref(false)
const isAdd = ref(true)
const id = ref(0)
const city = ref('')
const price = ref('')
const remain = ref('')
const _value = ref('')
const total = ref('')
const required = ref('')
const price_txt = ref('')
const type = ref('')
const user = ref('')

async function fetchNoloan() {
    let bodyContent = JSON.stringify({ "table": "noloan" })

    let response = await fetch('http://localhost/manara/api/crud/select/', {
        method: 'POST',
        body: bodyContent,
        headers: headersList
    })

    let data = await response.json()
    if (data.res.length > 0) {
        gridData.values = data.res
    }
}

onMounted(async () => {
    fetchNoloan()
    user.value = localStorage.getItem('id')
})

async function save() {
    let saved = true

    try {
        let bodyContent = JSON.stringify({
            "table": "noloan",
            "data": {
                "city": city.value,
                "price": price.value,
                "remain": remain.value,
                "_value": _value.value,
                "total": total.value,
                "required": required.value,
                "price_txt": price_txt.value,
                "type": type.value,
                "user": user.value
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
            fetchNoloan()
        }

    } catch (e) {
        // log error
        console.log(e)
    }
}

function reset() {
    showModal.value = false
    id.value = 0
    city.value = price.value = remain.value = _value.value = total.value = required.value = price_txt.value = type.value = user.value = ''
    isAdd.value = true
}

function editNoloan(myNoloan) {
    isAdd.value = false
    id.value = myNoloan.id
    city.value = myNoloan.city
    price.value = myNoloan.price
    remain.value = myNoloan.remain
    _value.value = myNoloan._value
    total.value = myNoloan.total
    required.value = myNoloan.required
    price_txt.value = myNoloan.price_txt
    type.value = myNoloan.type
    showModal.value = true
}

async function saveEdit() {
    let saved = true
    try {
        let bodyContent = JSON.stringify({
            "table": "noloan",
            "id": id.value,
            "data": {
                "city": city.value,
                "price": price.value,
                "remain": remain.value,
                "_value": _value.value,
                "total": total.value,
                "required": required.value,
                "price_txt": price_txt.value,
                "type": type.value,
                "user": user.value
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
            fetchNoloan()
        }

    } catch (e) {
        // log error
        console.log(e)
    }
}

async function deleteNoloan(myNoloan) {
    var ok = confirm('هل تريد مسح ' + myNoloan.city)
    if (ok) {
        let saved = true

        try {

            let bodyContent = JSON.stringify({
                "table": "noloan",
                "id": myNoloan.id
            })

            let response = await fetch("http://localhost/manara/api/crud/delete/", {
                method: "POST",
                body: bodyContent,
                headers: headersList
            })

            let data = await response.text()

            if (data) {
                reset()
                fetchNoloan()
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

        <DemoGrid :data="gridData.values" :columns="gridColumns" :columns-ar="gridColumnsAr" :filter-key="searchQuery"
            @del="deleteNoloan" @edit="editNoloan">
        </DemoGrid>

        <Teleport to="body">
            <!-- use the modal component, pass in the prop -->
            <modal :show="showModal" @close="showModal = false" @backdrop="reset">
                <template #header>
                    <h3 class="text-center d-inline">بيانات النولون</h3>
                    <h1 class="text-info" v-show="!isAdd">{{ id }}</h1>

                </template>
                <template #body>
                    <form class="form m-3" style="width: 350px;">
                        <input class="form-control w-100 my-1" type="text" name="city" v-model="city" placeholder="المدينة">
                        <input class="form-control w-100 my-1" type="text" name="price" v-model="price" placeholder="السعر">
                        <input class="form-control w-100 my-1" type="text" name="remain" v-model="remain"
                            placeholder="المتبقي">
                        <input class="form-control w-100 my-1" type="text" name="_value" v-model="_value"
                            placeholder="القيمة">
                        <input class="form-control w-100 my-1" type="text" name="total" v-model="total"
                            placeholder="الإجمالي">
                        <input class="form-control w-100 my-1" type="text" name="required" v-model="required"
                            placeholder="مطلوب">
                        <input class="form-control w-100 my-1" type="text" name="price_txt" v-model="price_txt"
                            placeholder="المبلغ بالنص">
                        <select class="form-select w-100 my-1" type="text" name="type" v-model="type" placeholder="النوع">
                            <option value="60%" default>60%</option>
                            <option value="70%">70%</option>
                        </select>

                        <button v-show="isAdd" type="submit" class="btn btn-success rounded-0 w-50 my-1"
                            @click.prevent="save">حفظ</button>
                        <button v-show="!isAdd" type="submit" class="btn btn-info rounded-0 w-50 my-1"
                            @click.prevent="saveEdit">تعديل</button>
                        <button type="reset" class="btn btn-danger rounded-0 w-50 my-1"
                            @click.prevent="reset">إلغاء</button>
                    </form>
                </template>
            </modal>
        </Teleport>

    </main>
</template>