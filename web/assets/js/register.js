function showNewCompanyOptions(event) {
    if (event.target.value === "new") {
        console.log("Creating new company");
    }
}

function init() {
    document.querySelector("#companyId").addEventListener('change', showNewCompanyOptions);
}

document.addEventListener('DOMContentLoaded', init);