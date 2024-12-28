document.addEventListener('DOMContentLoaded', function() {
    console.log('ActiveAdmin custom JavaScript loaded');

    // Confirmation dialog for delete actions
    const deleteLinks = document.querySelectorAll('.delete_link');
    deleteLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            const confirmed = confirm('Are you sure you want to delete this item?');
            if (!confirmed) {
                event.preventDefault(); // Prevent the default action if not confirmed
            }
        });
    });

    // Toggle sidebar visibility
    const toggleSidebarButton = document.getElementById('toggle-sidebar');
    if (toggleSidebarButton) {
        toggleSidebarButton.addEventListener('click', function() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('hidden'); // Toggle hidden class
        });
    }
});