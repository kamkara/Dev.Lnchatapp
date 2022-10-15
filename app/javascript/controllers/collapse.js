document.addEventListener('alpine:init', () => {
  Alpine.data('collapse', () => ({
    expanded: null,
    init() {
      const elem = this.$refs.content;
      elem.hidden = true;
      elem.classList.add('collapse__content');
    },
    toggle() {
      const elem = this.$refs.content;

      if (this.expanded) {
        // Remove the --collapse-height custom property so the browser uses
        // the fallback value of 0.
        elem.style.removeProperty('--collapse-height');
        elem.addEventListener(
          'transitionend',
          (e) => {
            // We need to make sure the event hasn't come from a child element
            // and bubbled up to our element.
            if (e.target === elem) {
              // Mark the element as hidden so its contents will be
              // hidden from assistive tech like screen readers or
              // keyboard navigation.
              elem.hidden = true;
              this.expanded = false;
            }
          },
          {
            once: true,
          }
        );
      } else {
        // Unhide our element so we can calculate its dimensions.
        // It will still be visually hidden because of the maxHeight
        // of 0.
        elem.hidden = false;
        // Set a --collapse-height property that matches the elements height.
        // This will cause the browser to animate the opening of the
        // element.
        elem.style.setProperty('--collapse-height', `${elem.scrollHeight}px`);
        elem.addEventListener(
          'transitionend',
          (e) => {
            // We need to make sure the event hasn't come from a child element
            // and bubbled up to our element.
            if (e.target === elem) {
              this.expanded = true;
            }
          },
          {
            once: true,
          }
        );
      }
    },
    updateHeight() {
      // A function to update the custom property on window resize, to avoid
      // clipping content if the scrollHeight value of the element changes.
      if (this.expanded) {
        const elem = this.$refs['content'];
        elem.style.setProperty('--collapse-height', `${elem.scrollHeight}px`);
      }
    },
  }));
});