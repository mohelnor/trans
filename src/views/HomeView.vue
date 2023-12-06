<script setup>
import { ref } from "vue";
import MyMenu from "../components/Menu.vue";
import Modal from '../components/modal.vue'

const showModal = ref(false)
</script>

<template>
    <header>
        <div class="card">
            <MyMenu class="shadow-1 p-0 m-0" />
        </div>
    </header>
    <main>
     
    </main>
    <RouterView />
</template>
