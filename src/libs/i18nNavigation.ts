import { createNavigation } from 'next-intl/navigation';

import { AllLocales, AppConfig } from '@/utils/AppConfig';

const routing = {
  locales: AllLocales,
  localePrefix: AppConfig.localePrefix,
  defaultLocale: AppConfig.defaultLocale,
};

export const { usePathname, useRouter } = createNavigation(routing);
