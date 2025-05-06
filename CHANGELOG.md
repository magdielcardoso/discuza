# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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