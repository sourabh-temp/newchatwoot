<template>
    <div>
      <h2>Subscription Plans</h2>
      <div v-for="plan in plans" :key="plan.id">
        <p>{{ plan.name }} - ₹{{ plan.amount / 100 }}</p>
        <button @click="subscribe(plan.id)">Subscribe</button>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios'
  
  export default {
    data() {
      return { plans: [] }
    },
    mounted() {
      axios.get('/api/plans').then(res => {
        this.plans = res.data
      })
    },
    methods: {
      subscribe(planId) {
        axios.post('/api/stripe/create-checkout-session', { plan_id: planId })
          .then(res => {
            window.location.href = res.data.url
          })
      }
    }
  }
  </script>
  