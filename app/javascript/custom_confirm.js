// Override Turbo's confirm dialog with a custom styled <dialog>.
// Falls back to native confirm() if the dialog element is missing.

import "@hotwired/turbo-rails"

const DIALOG_ID = "custom-confirm-dialog"

Turbo.setConfirmMethod((message) => {
  const dialog = document.getElementById(DIALOG_ID)
  if (!dialog) {
    return Promise.resolve(window.confirm(message))
  }

  const messageEl = dialog.querySelector("[data-confirm-message]")
  if (messageEl) messageEl.textContent = message

  dialog.returnValue = ""
  dialog.showModal()

  return new Promise((resolve) => {
    dialog.addEventListener(
      "close",
      () => resolve(dialog.returnValue === "confirm"),
      { once: true }
    )
  })
})
