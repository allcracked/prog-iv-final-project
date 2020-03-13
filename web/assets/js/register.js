const statuses = {
    newCompany: false,
};

function showNewCompanyOptions(event) {
    if (event.target.value === "new") {
        document.querySelector("#new-company-form").classList.add("new-company-form-active");
        statuses.newCompany = true;
    } else {
        document.querySelector("#new-company-form").classList.remove("new-company-form-active");
        statuses.newCompany = false;
    }
}

function selectUserRole(event) {
    const membershipSelect = document.querySelector("#userMembership");
    
    membershipSelect.options.length = 0;
    
    availableMemberships[event.target.value].forEach(function (role) {
        membershipSelect.options[membershipSelect.options.length] = new Option(role.name, role.id);
    });
}

function init() {
    document.querySelector("#companyId").addEventListener('change', showNewCompanyOptions);
    document.querySelector("#userRole").addEventListener('change', selectUserRole);
}

document.addEventListener('DOMContentLoaded', init);