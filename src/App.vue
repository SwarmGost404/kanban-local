<template>
  <div class="kanban">
    <div
      class="column"
      v-for="column in columns"
      :key="column.id"
    >
      <h2>{{ column.title }}</h2>
      <div class="create-task">
        <input
          v-model="newCardText[column.id]"
          placeholder="Новая задача"
          @keyup.enter="addCard(column.id)"
        />
        <button @click="addCard(column.id)">Добавить</button>
      </div>
      <Draggable
        :list="column.cards"
        group="kanban"
        item-key="id"
        class="cards"
      >
        <template #item="{ element }">
          <div class="card">
            {{ element.text }}
            <button @click="deleteCard(column.id, element.id)" class="btn-delete">X</button>
          </div>
        </template>
      </Draggable>
    </div>
  </div>
</template>

<script setup lang="ts">
import { reactive, watch } from 'vue'
import Draggable from 'vuedraggable'

interface Card {
  id: number
  text: string
}

interface Column {
  id: ColumnId
  title: string
  cards: Card[]
}

type ColumnId = 'todo' | 'inprogress' | 'done'

const STORAGE_KEY = 'kanban-board'

function defaultColumns(): Column[] {
  return [
    { id: 'todo', title: 'To Do', cards: [] },
    { id: 'inprogress', title: 'In Progress', cards: [] },
    { id: 'done', title: 'Done', cards: [] }
  ]
}

function loadFromStorage(): Column[] {
  const raw = localStorage.getItem(STORAGE_KEY)
  if (!raw) return defaultColumns()
  try {
    return JSON.parse(raw) as Column[]
  } catch {
    return defaultColumns()
  }
}

const columns = reactive<Column[]>(loadFromStorage())

const newCardText = reactive<Record<ColumnId, string>>({
  todo: '',
  inprogress: '',
  done: ''
})

function deleteCard(columnId: ColumnId, cardId: number) {
  const column = columns.find(c => c.id === columnId)
  if (!column) return

  column.cards = column.cards.filter(card => card.id !== cardId)
}

function addCard(columnId: ColumnId) {
  const column = columns.find(c => c.id === columnId)
  const text = newCardText[columnId]
  if (!column || !text.trim()) return

  column.cards.push({
    id: Date.now(),
    text: text.trim()
  })

  newCardText[columnId] = ''
}

watch(
  columns,
  (value) => {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(value))
  },
  { deep: true }
)
</script>

<style scoped>
.kanban {
  border: #f4f5f7 1px solid;
  width: 90%;
  height: 90%;
  position: absolute;
  left: 4%;
  top: 4%;
  display: flex;
  gap: 16px;
  padding: 20px;
}

.column {
  background: #f4f5f7;
  margin: auto;
  height: 90%;
  color: black;
  padding: 12px;
  width: 30%;
  border-radius: 8px;
  border: red 1px solid;
}

.cards {
  min-height: 40px;
  border: red 2px solid;
  height: 70%;
  padding: 5%;
  border-radius: 15px;
  
}

.column h2 {
  margin-bottom: 10px;
}

.card {
  background: white;
  padding: 8px;
  border-radius: 4px;
  margin-bottom: 8px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.15);
  cursor: grab;
}

.card:active {
  cursor: grabbing;
}

.create-task {
  position: relative;
  bottom: 0px;
  margin: 10px;
  margin-bottom: 50px;
  display: flex;
  input {
    width: 70%;
    background-color: white;
    color: black;
    border-radius: 5px;
    border: green 2px solid;
  }
  button {
    width: 25%;
    background-color: white;
    color: black;
  }
}

.btn-delete {
  background: transparent;
  border: none;
  color: white;
  font-size: 14px;
  cursor: pointer;
}
.card:hover {
  .btn-delete {
    color: red;
  }
}
</style>
