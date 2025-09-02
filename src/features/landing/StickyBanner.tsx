export const StickyBanner = (props: { children: React.ReactNode }) => (
  <div className="sticky top-0 z-50 bg-[hsl(222.2,47.4%,11.2%)] p-4 text-center text-lg font-semibold text-[hsl(210,40%,98%)] [&_a:hover]:text-indigo-500 [&_a]:text-fuchsia-500">
    {props.children}
  </div>
);
