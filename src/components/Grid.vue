<script setup>
import { ref, computed } from 'vue'

const props = defineProps({
  data: Array,
  columns: Array,
  columnsAr: {
    type: Array,

    default(rawProps) {
      return []
    }
  },
  filterKey: String
})

const sortKey = ref('')
const sortOrders = ref(
  props.columns.reduce((o, key) => ((o[key] = 1), o), {})
)

const filteredData = computed(() => {
  let { data, filterKey } = props
  if (filterKey) {
    filterKey = filterKey.toLowerCase()
    data = data.filter((row) => {
      return Object.keys(row).some((key) => {
        return String(row[key]).toLowerCase().indexOf(filterKey) > -1
      })
    })

  }

  const key = sortKey.value
  if (key) {
    const order = sortOrders.value[key]
    data = data.slice().sort((a, b) => {
      a = a[key]
      b = b[key]
      return (a === b ? 0 : a > b ? 1 : -1) * order
    })
  }
  return data
})


function sortBy(key) {
  sortKey.value = key
  sortOrders.value[key] *= -1
}

function capitalize(str) {
  if (props.columnsAr.length > 0) {
    return (props.columnsAr[props.columns.indexOf(str)])
  } else {
    return str.charAt(0).toUpperCase() + str.slice(1)
  }
}

</script>

<template>
  <div class="table-responsive w-100">

    <table class="table table-sm table-striped table-hover mt-2" v-if="filteredData.length">
      <thead class="bg-success text-white fw-100">
        <tr>
          <th v-for="key in columns" @click="sortBy(key)" :class="{ active: sortKey == key }">
            {{ capitalize(key) }}
            <span class="arrow" :class="sortOrders[key] > 0 ? 'asc' : 'dsc'"></span>
          </th>
          <th>الأجراء</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="entry in filteredData">
          <td v-for="key in columns">
            {{ entry[key] }}
          </td>
          <td>
            <div class="d-inline text-info mx-1" @click="$emit('edit', entry)">
              <i class="pi pi-pencil"></i>
            </div>
            <div class="d-inline text-danger mx-1" @click="$emit('del', entry)"><i class="pi pi-trash"></i></div>
          </td>
        </tr>
      </tbody>
    </table>
    <p v-else class="text-center alert alert-warning my-3">لا توجد نتيجة .. </p>
  </div>
</template>

<style scoped>
th {
  /* background-color: burlywood; */
}

th.active .arrow {
  opacity: 1;
}

.arrow {
  display: inline-block;
  vertical-align: middle;
  width: 0;
  height: 0;
  margin-left: 5px;
  opacity: 0.66;
}

.arrow.asc {
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-bottom: 4px solid #3f3f3f;
}

.arrow.dsc {
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-top: 4px solid #b2b2b2;
}
</style>