<script setup>
import MyMenu from "../components/Menu.vue"
import DemoGrid from '../components/Grid.vue'
import Modal from '../components/Modal.vue'

import { ref, reactive, onMounted, watch } from 'vue'
const showModal = ref(false)
const isAdd = ref(true)

const rows = ref(0)
const id = ref(0)
const company = ref('')
const board = ref('')
const driver = ref('')
const destination = ref('')
const shipment = ref('')
const type = ref('')
const amount = ref('')
const phone = ref('')
const user = ref('')

// items sections 
const items = ref([])
const itemsID = ref([])
const ton = ref([])
const price = ref([])
const fuel = ref([])
const cashReceved = ref([])
const transaction = ref([])
const zakatFine = ref([])
const cashRemained = ref([])

const searchQuery = ref('')
const gridColumns = [`id`, `board`, `company`, `driver`, `destination`, `shipment`, `type`, `amount`, `phone`, `user`, `created`, `updated`]
const gridColumnsAr = [`#`, `اللوحه`, `الشركة`, `السائق`, `الوجهة`, `الشحنه`, `النوع`, `الكمبة`, `الهانف`, `الكاتب`, `الإضافة`, `التعديل`]
const gridData = ref([])

let headersList = {
    Accept: '*/*',
    'Content-Type': 'application/json'
}

async function fetchTerheel() {
    let bodyContent = JSON.stringify({ "table": "vehicle" })

    let response = await fetch('http://localhost/manara/api/crud/select/', {
        method: 'POST',
        body: bodyContent,
        headers: headersList
    })

    let data = await response.json()
    if (data.res.length > 0) {
        gridData.value = data.res
    }
}

async function fetchItems(vehicle) {

    let bodyContent = JSON.stringify({ "table": "item", "where": "vehicle = " + vehicle })

    let response = await fetch('http://localhost/manara/api/crud/select/', {
        method: 'POST',
        body: bodyContent,
        headers: headersList
    })

    let data = await response.json()
    if (data.res.length > 0) {
        rows.value = data.res.length
        editItems(data.res)
    }
}

onMounted(async () => {
    fetchTerheel()
    user.value = localStorage.getItem('id')
})

function pushItems() {
    for (let index = 1; index <= rows.value; index++) {
        items.value[index] = {
            "id": itemsID.value[index] ?? null,
            "ton": ton.value[index],
            "price": price.value[index],
            "fuel": fuel.value[index],
            "cash_receved": cashReceved.value[index],
            "transaction": transaction.value[index],
            "zakat_fine": zakatFine.value[index],
            "cash_remained": cashRemained.value[index]
        }
    }

    items.value = items.value.filter((e) => {
        if (e != null) {
            return e
        }
    })
}

function editItems(myItems) {
    let step = 1
    myItems.forEach(e => {
        itemsID.value[step] = e.id
        ton.value[step] = e.ton
        price.value[step] = e.price
        fuel.value[step] = e.fuel
        cashReceved.value[step] = e.cash_receved
        transaction.value[step] = e.ton
        zakatFine.value[step] = e.zakat_fine
        cashRemained.value[step] = e.cash_remained
        step++
    })
}

async function save() {
    let saved = true

    pushItems()

    try {

        let bodyContent = JSON.stringify({
            "table": "vehicle",
            "table2": "item",
            "key": "vehicle",
            "data": {
                "company": company.value,
                "board": board.value,
                "driver": driver.value,
                "destination": destination.value,
                "shipment": shipment.value,
                "type": type.value,
                "amount": amount.value,
                "phone": phone.value,
                "user": user.value,
            },
            "data2": items.value
        })

        let response = await fetch("http://localhost/manara/api/crud/insert_sub/", {
            method: "POST",
            body: bodyContent,
            headers: headersList
        })

        let data = await response.text()
        if (data) {
            reset()
            fetchTerheel()
        }

    } catch (e) {
        // log error
        console.log(e)
    }
}

function editTerheel(terheel) {
    isAdd.value = false
    // data
    id.value = terheel.id
    company.value = terheel.company
    board.value = terheel.board
    driver.value = terheel.driver
    destination.value = terheel.destination
    shipment.value = terheel.shipment
    type.value = terheel.type
    amount.value = terheel.amount
    phone.value = terheel.phone
    showModal.value = true

    fetchItems(terheel.id)
}

async function saveEdit() {
    let saved = true

    pushItems()

    try {

        let bodyContent = JSON.stringify({
            "table": "vehicle",
            "id": id.value,
            "table2": "item",
            "key": "vehicle",
            "data": {
                "company": company.value,
                "board": board.value,
                "driver": driver.value,
                "destination": destination.value,
                "shipment": shipment.value,
                "type": type.value,
                "amount": amount.value,
                "phone": phone.value,
                "user": user.value,
            },
            "data2": items.value
        })
        let response = await fetch("http://localhost/manara/api/crud/update_sub/", {
            method: "POST",
            body: bodyContent,
            headers: headersList
        })

        let data = await response.text()

        if (data) {
            reset()
            fetchTerheel()
        }

    } catch (e) {
        // log error
        console.log(e)
    }
}

async function delTerheel(terheel) {
    var ok = confirm('هل تريد مسح ' + terheel.id)
    if (ok) {
        let saved = true

        try {

            let bodyContent = JSON.stringify({
                "table": "vehicle",
                "id": terheel.id
            })

            let response = await fetch("http://localhost/manara/api/crud/delete/", {
                method: "POST",
                body: bodyContent,
                headers: headersList
            })

            let data = await response.text()

            if (data) {
                reset()
                fetchTerheel()
            }

        } catch (e) {
            console.log(e)
        }
    }
}

function reset() {
    showModal.value = false
    id.value = 0
    company.value = board.value = driver.value = destination.value = ''
    shipment.value = type.value = amount.value = phone.value = user.value = ''
    ton.value = []
    price.value = []
    fuel.value = []
    cashReceved.value = []
    transaction.value = []
    zakatFine.value = []
    cashRemained.value = []
    isAdd.value = true
}

watch(showModal, (newShowModal) => {
    rows.value = 1
})
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
        <DemoGrid :data="gridData" :columns="gridColumns" :columns-ar="gridColumnsAr" :filter-key="searchQuery" @del="delTerheel" @edit="editTerheel">
        </DemoGrid>

        <Teleport to="body">
            <!-- use the modal component, pass in the prop -->
            <modal :show="showModal" @close="showModal = false" @backdrop="reset">
                <template #header>
                    <div class="text-center">
                        <h3>بيانات الترحيل</h3>
                    </div>
                </template>
                <template #body>
                    <form class="form row m-3 g-0 p-1" style="width: 650px;">
                        <div class="col-8 px-1">
                            <input class="form-control my-1" type="text" name="company" v-model="company"
                                placeholder="الشركة">
                        </div>
                        <div class="col-4 px-1">
                            <input class="form-control my-1" type="text" name="board" v-model="board" placeholder="اللوحة">
                        </div>
                        <div class="col-12 px-1">
                            <input class="form-control my-1" type="text" name="driver" v-model="driver"
                                placeholder="السائق">
                        </div>
                        <div class="col-4 px-1">
                            <input class="form-control my-1" type="text" name="destination" v-model="destination"
                                placeholder="الوجهه">
                        </div>
                        <div class="col-4 px-1">
                            <input class="form-control my-1" type="text" name="shipment" v-model="shipment"
                                placeholder="الشحنة">
                        </div>
                        <div class="col-4 px-1">
                            <input class="form-control my-1" type="text" name="type" v-model="type" placeholder="النوع">
                        </div>
                        <div class="col-5 px-1">
                            <input class="form-control my-1" type="text" name="amount" v-model="amount"
                                placeholder="الكمية">
                        </div>
                        <div class="col-7 px-1">
                            <input class="form-control my-1" type="text" name="phone" v-model="phone" placeholder="الهاتف">
                        </div>
                        <div class="table-responsive overflow-auto" style="height: 150px;">
                            <table class="table table-sm text-center">
                                <thead>
                                    <th>الكمية بالطن</th>
                                    <th>السعر</th>
                                    <th>قيمة الجاز</th>
                                    <th>المبلغ المستلم</th>
                                    <th>رقم العملية</th>
                                    <th>زكاة و مخالفة</th>
                                    <th>سداد المتبقي</th>
                                    <th> <button @click.prevent="rows++" class="btn text-success p-0">
                                            <i class="pi pi-plus"></i>
                                        </button></th>
                                </thead>
                                <tbody>
                                    <tr v-for="row in rows" key="row">
                                        <td>
                                            <input type="text" v-model="ton[row]" :id="'ton-' + row" name="ton"
                                                placeholder="الكمية بالطن" class="form-control p-1">
                                        </td>
                                        <td>
                                            <input type="text" v-model="price[row]" :id="'price-' + row" name="price"
                                                placeholder="السعر" class="form-control p-1">
                                        </td>
                                        <td>
                                            <input type="text" v-model="fuel[row]" :id="'fuel-' + row" name="fuel"
                                                placeholder="قيمة الجاز" class="form-control p-1">
                                        </td>
                                        <td>
                                            <input type="text" v-model="cashReceved[row]" :id="'cash-' + row" name="cash"
                                                placeholder="المبلغ المستلم" class="form-control p-1">
                                        </td>
                                        <td>
                                            <input type="text" v-model="transaction[row]" :id="'trans-' + row" name="trans"
                                                placeholder="رقم العملية" class="form-control p-1">
                                        </td>
                                        <td>
                                            <input type="text" v-model="zakatFine[row]" :id="'zakat-' + row" name="zakat"
                                                placeholder="زكاة و مخالفة" class="form-control p-1">
                                        </td>
                                        <td>
                                            <input type="text" v-model="cashRemained[row]" :id="'remained-' + row"
                                                name="remained" placeholder="سداد المتبقي" class="form-control p-1">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

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