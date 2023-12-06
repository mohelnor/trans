<script setup lang="ts">
import { onBeforeMount, reactive } from 'vue'

import { useRouter } from 'vue-router'

const router = useRouter();

const user = reactive({
    name: 'mohammed',
    password: '123'
})

onBeforeMount(() => {
    user.name = localStorage.getItem('name')!
    user.password = localStorage.getItem('password')!
})

async function onsubmit() {
    let headersList = {
        Accept: '*/*',
        'Content-Type': 'application/json'
    }

    let bodyContent = JSON.stringify(user)

    let response = await fetch('http://localhost/manara/api/auth/signin.php', {
        method: 'POST',
        body: bodyContent,
        headers: headersList
    })

    let data = await response.json()
    console.log(data)

    if (data.msg == '200') {
        localStorage.setItem('id', data.res.id)
        localStorage.setItem('name', user.name)
        localStorage.setItem('fullname', user.name)
        localStorage.setItem('password', user.password)
        // console.log(user);
        router.replace('/home')
    }
}
</script>

<template>
    <div class="d-flex align-items-center justify-content-center vh-100" style="background-color: #10b981;">
        <div class="card p-5 w-50">
            <input id="name" type="text" placeholder="user name" class="form-control my-1" v-model="user.name" />
            <input id="password1" type="password" placeholder="Password" class="form-control my-1" v-model="user.password" />
            <button class="btn btn-success w-100 my-2" @click.prevent="onsubmit" style="background-color: #10b981;"><i class="pi pi-user px-2"></i> Sign In</button>
        </div>
    </div>
</template>

<style scoped></style>
