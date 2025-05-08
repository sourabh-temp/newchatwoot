import { frontendURL } from '../../../../helper/URLHelper';
const SettingsContent = () => import('../Wrapper.vue');
const Index = () => import('./Index.vue');

export default {
  routes: [
    {
      path: frontendURL('accounts/:accountId/settings/pricing_plans'),
      name: 'pricing_settings_index',
      component: SettingsContent,
      meta: {
        permissions: ['administrator'],
      },
      props: {
        headerTitle: 'SIDEBAR.PRICING_PLAN',
        icon: 'i-lucide-credit-card',
        showNewButton: false,
      },
      children: [
        {
          path: '',
          name: 'pricing_settings_index',
          component: Index,
          meta: {
            permissions: ['administrator'],
          },
        },
      ],
    },
  ],
};
