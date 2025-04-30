<template>
    <div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div class="bg-white dark:bg-slate-800 p-6 rounded-lg w-[400px] shadow-md">
        <h2 class="text-lg font-semibold mb-4 text-slate-900 dark:text-white">
          Edit Twilio Channel Keys
        </h2>
  
        <form @submit.prevent="submitForm">
          <div class="mb-4">
            <label class="block text-sm mb-1">Phone Number</label>
            <input
              v-model="phoneNumber"
              type="text"
              class="w-full border rounded p-2"
              placeholder="+1234567890"
            />
          </div>
  
          <div class="mb-4">
            <label class="block text-sm mb-1">Account SID</label>
            <input
              v-model="accountSid"
              type="text"
              class="w-full border rounded p-2"
              placeholder="ACxxxxxxxxxxxx"
            />
          </div>
  
          <div class="mb-4">
            <label class="block text-sm mb-1">Auth Token</label>
            <input
              v-model="authToken"
              type="password"
              class="w-full border rounded p-2"
              placeholder="**********"
            />
          </div>
  
          <div class="flex justify-end gap-2">
            <button type="button" @click="$emit('close')" class="px-4 py-2 bg-gray-300 rounded">
              Cancel
            </button>
            <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded">
              Save
            </button>
          </div>
        </form>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, watch, onMounted } from 'vue';
  
  const props = defineProps({
    inbox: Object,
  });
  
  const emit = defineEmits(['close']);
  
  const phoneNumber = ref('');
  const accountSid = ref('');
  const authToken = ref('');
  
  // Log when mounted
  onMounted(() => {
    console.log('🟢 Component mounted. Initial inbox:', props.inbox);
  });
    watch(
    () => props.inbox,
    newVal => {
      console.log('📦 Inbox updated:', newVal);
      phoneNumber.value = newVal?.channel?.phone_number || '';
      accountSid.value = newVal?.channel?.account_sid || '';
      authToken.value = newVal?.channel?.auth_token || '';
    },
    { immediate: true }
  );
  
  const submitForm = async () => {
    console.log('💾 Saving Twilio:', {
      phone_number: phoneNumber.value,
      account_sid: accountSid.value,
      auth_token: authToken.value,
    });
  
    emit('close');
  };
  </script>
  