<template>
    <div class="p-4">
      <h1 class="text-2xl font-bold mb-4">Pricing Settings</h1>
      <p class="mb-4">
        Chatwoot helps 15,000+ organizations worldwide to manage their customer support workflows. 
        Signup for your 15-day free trial, and experience the full power of Chatwoot.
      </p>
      <a href="#" class="text-blue-600 underline mb-6 inline-block">Looking for self-hosted plans? Click here to know more</a>
  
      <div class="overflow-x-auto">
        <table class="table-auto w-full border-collapse border border-gray-300">
          <thead>
            <tr class="bg-gray-100">
              <th class="border px-4 py-2 text-left">Feature / Plans</th>
              <th class="border px-4 py-2 text-center">Hacker</th>
              <th class="border px-4 py-2 text-center">Startups</th>
              <th class="border px-4 py-2 text-center">Business</th>
              <th class="border px-4 py-2 text-center">Enterprise</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="border px-4 py-2 font-medium">Pricing</td>
              <td class="border px-4 py-2 text-center">$0 /agent/month<br><small>up to 2 agents</small><br><button class="mt-1 px-3 py-1 text-sm bg-blue-600 text-white rounded">Create a free account</button></td>
              <td class="border px-4 py-2 text-center">$19 /agent/month<br><button class="mt-1 px-3 py-1 text-sm bg-blue-600 text-white rounded">Buy Startups</button></td>
              <td class="border px-4 py-2 text-center">$39 /agent/month<br><button class="mt-1 px-3 py-1 text-sm bg-blue-600 text-white rounded">Buy Business</button></td>
              <td class="border px-4 py-2 text-center">$99 /agent/month<br><button class="mt-1 px-3 py-1 text-sm bg-blue-600 text-white rounded">Buy Enterprise</button></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'PricingSettings',
  };
  </script>
  