# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.1] - 2025-05-22

### Added
*   Implemented voting system (upvote/downvote) for discussions with dynamic UI updates via Turbo.
*   Added discussion pinning functionality for administrators with visual indicators and top sorting.
*   Implemented category badges on discussion cards with custom colors and icons.
*   Added pagination for discussions using Kaminari gem (10 discussions per page).
*   Created comprehensive administrative system for categories (CRUD operations).
*   Implemented system configuration panel for administrators with:
    *   Custom logo upload functionality using Active Storage.
    *   Site name, description, and contact email settings.
    *   Configurable primary color theme system (16 color options).
*   Added "See all" links in category section with post counters.
*   Added posting dates to recommended discussions sidebar.
*   Created CSS custom properties system for dynamic theming.
*   Added admin-only "System Settings" option in user dropdown menu.
*   Implemented "Coming soon" badge for filters button.

### Changed
*   Improved dark mode styling with softer black backgrounds (`neutral-800` instead of `neutral-900`).
*   Reorganized discussion card layout: title at top, category badge alongside title, user info moved to bottom right.
*   Enhanced home page to show only top 4 categories with most posts.
*   Truncated long titles in "Most Voted" sidebar section for better readability.
*   Updated navbar to use dynamic logo from system configuration when available.
*   Optimized category display queries for better performance.
*   Improved CSS specificity handling for dark mode text colors.
*   Enhanced discussion card visual hierarchy and spacing.

### Fixed
*   Fixed `NameError` related to 'compact' variable in voting partial.
*   Corrected CSS conflicts between global styles and Tailwind classes in dark mode.
*   Fixed category card navigation functionality to properly link to category pages.
*   Resolved title visibility issues in dark mode across multiple pages.
*   Fixed badge alignment in discussion cards using baseline alignment.
*   Corrected "New Category" button styling conflicts between global CSS and Tailwind.

## [0.1.0] - 2025-05-03

### Added
*   Installed and configured ActionText for rich text editing.
*   Generated scaffold for `Discussion` (`title:string`, `content:rich_text`, `user:references`, `pinned:boolean`, `closed:boolean`).
*   Generated scaffold for `Reply` (`discussion:references`, `user:references`, `content:rich_text`, `marked_as_answer:boolean`).
*   Generated `Vote` model (`user:references`, `votable:references{polymorphic}`, `value:integer`).
*   Generated `Reaction` model (`user:references`, `reactable:references{polymorphic}`, `emoji:string`).
*   Executed corresponding migrations for new models/scaffolds.
*   Configured basic associations and validations in models (`User`, `Discussion`, `Reply`, `Vote`, `Reaction`).
*   Generated basic test files for new models/scaffolds.
*   Implemented `before_action :authenticate_user!` in `DiscussionsController`.
*   Generated and styled Devise views (login, sign up, password recovery, confirmation) with Tailwind, including dark mode.
*   Created specific `auth.html.erb` layout for Devise, centering content and adding a side image with a quote.
*   Created `user_initials` helper to generate name initials.
*   Created Stimulus `dropdown` controller to manage the user menu in the navbar.

### Changed
*   Adjusted spacing and appearance of the New Discussion page.
*   Updated navbar to:
    *   Use the Stimulus `dropdown` controller.
    *   Display user initials (via `user_initials` helper) when no avatar is present.
    *   Show "Sign In" / "Sign Up" buttons for logged-out users.
*   Refactored `modal_controller.js` to fix the Devise profile edit modal:
    *   Abandoned generic modal approach.
    *   Added specific `profileModal` target and `openProfileModal` action.
    *   Adjusted `close` and `closeWithBackground` actions for the new target.
    *   Updated `devise/registrations/edit.html.erb` view to use the new modal target and action.

### Fixed
*   Fixed issue where the Devise profile edit modal did not open correctly after previous modifications to `modal_controller.js`. 