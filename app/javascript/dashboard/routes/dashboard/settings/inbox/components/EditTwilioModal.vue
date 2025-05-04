<template>
  <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
    <div class="bg-white dark:bg-slate-800 p-6 rounded-lg w-[400px] shadow-md">
      <div v-if="successMessage" class="mb-4 p-3 text-green-800 bg-green-100 rounded">
        {{ successMessage }}
      </div>
      <h2 class="text-lg font-semibold mb-4 text-slate-900 dark:text-white">Edit Twilio Channel Keys</h2>
      <div v-if="loading" class="flex justify-center items-center">
        <span class="spinner-border"></span>
      </div>
      <form v-else @submit.prevent="submitForm">
        <div class="mb-4">
          <label class="block text-sm mb-1">Phone Number</label>
          <input v-model="phoneNumber" type="text" class="w-full border rounded p-2" placeholder="+1234567890" />
        </div>
        <div class="mb-4">
          <label class="block text-sm mb-1">Account SID</label>
          <input v-model="accountSid" type="text" class="w-full border rounded p-2" placeholder="ACxxxxxxxxxxxx" />
        </div>
        <div class="mb-4">
          <label class="block text-sm mb-1">Auth Token</label>
          <input v-model="authToken" type="password" class="w-full border rounded p-2" placeholder="**********" />
        </div>
        <div class="mb-4">
          <label class="block text-sm mb-1">Messaging Service SID</label>
          <input v-model="messagingServiceSid" type="text" class="w-full border rounded p-2"
            placeholder="MGxxxxxxxxxxxx" />
        </div>
        <div class="mb-4">
          <label class="block text-sm mb-1">API Key SID</label>
          <input v-model="apiKeySid" type="text" class="w-full border rounded p-2" placeholder="SKxxxxxxxxxxxx" />
        </div>
        <div class="flex justify-end gap-2">
          <button type="button" @click="$emit('close')" class="px-4 py-2 bg-gray-300 rounded">Cancel</button>
          <button type="submit" class="px-4 py-2 bg-blue-600 rounded">Save</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
const props = defineProps({ inbox: Object });
const emit = defineEmits(['close']);
const phoneNumber = ref('');
const accountSid = ref('');
const authToken = ref('');
const messagingServiceSid = ref('');
const apiKeySid = ref('');
const loading = ref(true);
onMounted(async () => {
  try {
    const response = await axios.get('/get_channelKey', {
      params: {
        inbox_id: props.inbox?.id
      }
    });
    const data = response.data;
    phoneNumber.value = data.phone_number;
    accountSid.value = data.account_sid;
    authToken.value = data.auth_token;
  } catch (error) {
    console.error('Error fetching Twilio channel keys:', error);
  } finally {
    loading.value = false;
  }
});
const successMessage = ref('');
const submitForm = async () => {
  try {
    await axios.post('/update_channelkey', {
      inbox_id: props.inbox?.id,
      phone_number: phoneNumber.value,
      account_sid: accountSid.value,
      auth_token: authToken.value,
      messaging_service_sid: messagingServiceSid.value,
      api_key_sid: apiKeySid.value
    });
    successMessage.value = 'Keys updated successfully!';
    setTimeout(() => {
      successMessage.value = '';
      emit('close');
    }, 1500); 
  } catch (e) {
    console.error('Failed to update Twilio keys:', e);
  }
};
</script>
