//password 
var a;
function pass()
{
    if(a==1)
    {
        document.getElementById("password").type="password";
        document.getElementById("pass-icon").src="pass-hide.png"
        a=0;
    }
    else
    {
        document.getElementById("password").type="text";
        document.getElementById("pass-icon").src="pass-show.png"
        a=1;
    }
    return 0;
}

//comfirm password

var b;
function cpass()
{
    if(b==1)
    {
        document.getElementById("comfirmpassword").type="password";
        document.getElementById("cpass-icon").src="pass-hide.png"
        b=0;
    }
    else
    {
        document.getElementById("comfirmpassword").type="text";
        document.getElementById("cpass-icon").src="pass-show.png"
        b=1;
    }
    return 0;
};

var submit = document.getElementById("button");
submit.addEventListener("click" , function()
{
    alert("sign up successfull")
})



