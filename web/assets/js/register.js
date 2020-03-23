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
    if (!event.target.value) return;
    
    const membershipSelect = document.querySelector("#userMembership");
    
    membershipSelect.options.length = 0;
    
    availableMemberships[event.target.value].forEach(function (role) {
        membershipSelect.options[membershipSelect.options.length] = new Option(role.name, role.id);
    });
    
    const fakeEvent = {target: {value: availableMemberships[event.target.value][0].id}};
    selectMembership(fakeEvent);
}

function selectMembership(event) {
    if (!event.target.value) return;
    
    const selectedMembership = memberships[event.target.value];
    document.querySelector("#membership-title").innerHTML = selectedMembership.name;
    document.querySelector("#membership-subtitle").innerHTML = "$" + selectedMembership.price;
    document.querySelector("#memebership-title").innerHTML = selectedMembership.description;
    
    document.querySelector("#membership-description").classList.add("membership-card-active");
}

function init() {
    document.querySelector("#userRole").addEventListener('change', selectUserRole);
    document.querySelector("#userMembership").addEventListener('change', selectMembership);
}

document.addEventListener('DOMContentLoaded', init);