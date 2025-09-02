import { createNavigation } from 'next-intl/navigation';

import { AllLocales, AppConfig } from '@/utils/AppConfig';

const routing = {
  locales: AllLocales,
  localePrefix: AppConfig.localePrefix,
};

export const { usePathname, useRouter } = createNavigation(routing);
