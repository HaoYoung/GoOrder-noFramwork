var profile, address, payment, pass, dele, contact, arr, row1, row2, row3, row4, row5, row6;

profile = document.getElementById('profile');
address = document.getElementById('address');
payment = document.getElementById('payment');
pass = document.getElementById('pass');
dele = document.getElementById('delete');
contact = document.getElementById('contact');
arr = [profile, address, payment, pass, dele, contact];

row1 = document.getElementById('row1');
row2 = document.getElementById('row2');
row3 = document.getElementById('row3');
row4 = document.getElementById('row4');
row5 = document.getElementById('row5');
row6 = document.getElementById('row6');

var row1_t = document.getElementById('row1-title');
var row2_t = document.getElementById('row2-title');
var row3_t = document.getElementById('row3-title');
var row4_t = document.getElementById('row4-title');
var row5_t = document.getElementById('row5-title');

var row1_c = document.getElementById('row1-info');
var row2_c = document.getElementById('row2-info');
var row3_c = document.getElementById('row3-info');
var row4_c = document.getElementById('row4-info');
var row5_c = document.getElementById('row5-info');

var pop = document.getElementById('id01');
var pop_window = document.getElementById('id02');
var update_btn = document.getElementById('update-btn');
var add_btn = document.getElementById('add-btn');
var pop_label1 = document.getElementById('pop-label1');
var pop_label2 = document.getElementById('pop-label2');
var pop_label3 = document.getElementById('pop-label3');
var pop_label4 = document.getElementById('pop-label4');
var pop_label5 = document.getElementById('pop-label5');

var pop_label1_holder = document.getElementById('pop-label1-holder');
var pop_label2_holder = document.getElementById('pop-label2-holder');
var pop_label3_holder = document.getElementById('pop-label3-holder');
var pop_label4_holder = document.getElementById('pop-label4-holder');
var pop_label5_holder = document.getElementById('pop-label5-holder');

var new_info1 = document.getElementById('new-info1');
var new_info2 = document.getElementById('new-info2');
var new_info3 = document.getElementById('new-info3');
var new_info4 = document.getElementById('new-info4');
var new_info5 = document.getElementById('new-info5');

var changePass = document.getElementById('id03');
var deleteAcc = document.getElementById('id04');

var rowArr = [false, false, false, false, false];

profile.addEventListener('click', function() {
    resetButton();
    profile.classList.add('active');
    row1.style.display = 'block';
    row2.style.display = 'block';
    row3.style.display = 'block';
    row1_t.textContent = 'Name';
    row2_t.textContent = 'Email';
    row3_t.textContent = 'Phone';
    pop_label1.textContent = 'New First Name';
    pop_label2.textContent = 'New Last Name';
    pop_label1_holder.style.display = 'block';
    pop_label2_holder.style.display = 'block';
    pop_label3_holder.style.display = 'none';
    pop_label4_holder.style.display = 'none';
    pop_label5_holder.style.display = 'none';
});
                                                    
address.addEventListener('click', function() {
    resetButton();
    address.classList.add('active');
    row1.style.display = 'block';
    row6.style.display = 'block';
    //row2.style.display = 'block';
    //row3.style.display = 'block';
    //row4.style.display = 'block';
    //row5.style.display = 'block';
    row1_t.textContent = 'Address 1';
    row2_t.textContent = 'Address 2';
    row3_t.textContent = 'Address 3';
    row4_t.textContent = 'Address 4';
    row5_t.textContent = 'Address 5';
    pop_label1.textContent = 'Street Address';
    pop_label2.textContent = 'Suite/Apt #';
    pop_label3.textContent = 'City';
    pop_label4.textContent = 'State';
    pop_label5.textContent = 'Zip Code';
    pop_label1_holder.style.display = 'block';
    pop_label2_holder.style.display = 'block';
    pop_label3_holder.style.display = 'block';
    pop_label4_holder.style.display = 'block';
    pop_label5_holder.style.display = 'block';

});

payment.addEventListener('click', function() {
    resetButton();
    payment.classList.add('active');
    row1.style.display = 'block';
    row6.style.display = 'block';
    //row2.style.display = 'block';
    //row3.style.display = 'block';
    //row4.style.display = 'block';
    //row5.style.display = 'block';
    row1_t.textContent = 'Payment 1';
    row2_t.textContent = 'Payment 2';
    row3_t.textContent = 'Payment 3';
    row4_t.textContent = 'Payment 4';
    row5_t.textContent = 'Payment 5';
    pop_label1.textContent = 'Card Number';
    pop_label2.textContent = 'Expiration Date';
    pop_label3.textContent = 'Security Code';
    pop_label4.textContent = 'Billing Zip Code';
    pop_label1_holder.style.display = 'block';
    pop_label2_holder.style.display = 'block';
    pop_label3_holder.style.display = 'block';
    pop_label4_holder.style.display = 'block';
    pop_label5_holder.style.display = 'none';
});

pass.addEventListener('click', function() {
    resetButton();
    pass.classList.add('active');
    //row1_t.textContent = 'Enter Current Password';
    //row2_t.textContent = 'Enter New Password';
    //row3_t.textContent = 'Repeat Password';
    changePass.style.display = 'block';
});

dele.addEventListener('click', function() {
    resetButton();
    dele.classList.add('active');
    //row1_t.textContent = 'Enter Password to Authorize';
    deleteAcc.style.display = 'block';
});
     
contact.addEventListener('click', function() {
    resetButton();
    contact.classList.add('active');
    row1.style.display = 'block';
    row2.style.display = 'block';
    row3.style.display = 'block';
    row1_t.textContent = 'Email';
    row2_t.textContent = 'Phone';
    row3_t.textContent = 'Address';
});

row1_c.addEventListener('click', function() {
    initRowArr();
    rowArr[0] = true;
    pop.style.display = 'block';
});

row2_c.addEventListener('click', function() {
    initRowArr();
    rowArr[1] = true;
    pop_label1.textContent = 'New Email';
    pop_label1_holder.style.display = 'block';
    pop_label2_holder.style.display = 'none';
    pop.style.display = 'block';
});

row3_c.addEventListener('click', function() {
    initRowArr();
    rowArr[2] = true;
    pop_label1.textContent = 'New Phone Number';
    pop_label1_holder.style.display = 'block';
    pop_label2_holder.style.display = 'none';
    pop.style.display = 'block';
});

// when user click outside the window, the window will be closed
pop.addEventListener('click', function(event) {
    var isClickInside = pop_window.contains(event.target);
    
    if(!isClickInside) {
        pop.style.display = 'none';
    }
});

// Update user information
update_btn.addEventListener('click', function() {
    switch(rowArr.indexOf(true)) {
        case 0:
            var info1 = new_info1.value;
            var info2 = new_info2.value;
            row1_c.textContent = info1 + ' ' + info2;
            break;
        case 1:
            var info = new_info1.value;
            row2_c.textContent = info;
            break;
        case 2:
            var info = new_info1.value;
            row3_c.textContent = info;
        default:
            
            break;
    }
    
    pop.style.display = 'none';
});

add_btn.addEventListener('click', function() {
    pop.style.display = 'block';
});

function resetButton() {
    for (var i=0; i<arr.length; i++){
        arr[i].classList.remove('active');
    }
    changePass.style.display = 'none';
    deleteAcc.style.display = 'none';
    row1.style.display = 'none';
    row2.style.display = 'none';
    row3.style.display = 'none';
    row4.style.display = 'none';
    row5.style.display = 'none';
    row6.style.display = 'none';
}

function initRowArr() {
    new_info1.value = ' ';
    new_info2.value = ' ';
    for(var i=0; i<rowArr.length; i++){
        rowArr[i] = false;
    }
}

function initPage() {
    resetButton();
    profile.classList.add('active');
    row1.style.display = 'block';
    row2.style.display = 'block';
    row3.style.display = 'block';
    row4.style.display = 'none';
    row5.style.display = 'none';
    row1_t.textContent = 'Name';
    row2_t.textContent = 'Email';
    row3_t.textContent = 'Phone';
}

initPage();