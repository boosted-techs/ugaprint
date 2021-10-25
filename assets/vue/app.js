new Vue ({
    delimiters : ["%%", "%%"],
    el : "#login-search-box",
    data : {
        interest : 'null',
        lowerAge : 18,
        upperAge : 34,
        locationReturnedList: [],
        inputDisabled : false,
        inCorrectInput : false,
        locationId : false,
        locationPlaceHolder : "Your city name",
        location : '',
        view : 'locationBeforeSearch',
        locationSearchResult : 'Come here babe',
        dropDown : false,
        selectedLocation : null,
        inputSubmitDisabled : true
    },
    methods : {
        loginSearch : function (e) {
            this.inputDisabled = true
            this.inputSubmitDisabled = true
            let form = new FormData()
            form.append("location", this.selectedLocation)
            form.append("lowerAge", this.lowerAge)
            form.append("upperAge", this.upperAge)
            form.append("interests", this.interest)
            axios({
                method : "post",
                url : "//" + window.location.host + "/search-matches",
                data : form
            })
            .then(function (response) {
                let status = response.data;
                console.log(status)
                if (status)
                    window.location = "//" + window.location.host + "/" + status
                else {
                    this.inputDisabled = false
                    this.inputSubmitDisabled = true
                }
            })
            .catch(function (error){
                console.log(error)
            })
        },
        matchByLocation : function (e) {
            let vueInstance = this;
            let location = this.location;
            if (location.length > 0) {
                let form = new FormData();
                form.append("locationString", location);
                axios({
                    method: 'post',
                    url: "//" + window.location.host + "/search-location",
                    data : form
                }) . then (function (response) {
                    //console.log(response.data)
                    if (response.data) {
                        let r = response.data; //Json response
                        //console.log(vueInstance.componentsArray)
                        if (vueInstance.dropDown === false) {
                            //vueInstance.view = vueInstance.componentsArray.locationTwo;
                            vueInstance.dropDown = true
                        }
                        vueInstance.locationReturnedList = r;
                    } else
                        console.log("Error")
                }).catch(function (error) {
                    console.log(error)
                })
            } else {
                //vueInstance.view = vueInstance.componentsArray.locationOne;
                vueInstance.dropDown = false
                vueInstance.locationSearchResult = ''
            }
        },
        selectLocation : function(location = false, city = false, country = false){
            this.location = city + " - " + country
            this.selectedLocation = location
            if (this.interest !== "null" && this.selectedLocation !== null)
                this.inputSubmitDisabled = false
            this.dropDown = false
        },
        checkForm : function() {
            if (this.interest !== "null" && this.selectedLocation !== null)
                this.inputSubmitDisabled = false
        }
    }
});

new Vue ({
    el : "#createAccount",
    delimiters : ["%%", "%%"],
    data : () => {
        return {
            dateOfBirth: '',
            level: 0,
            namePlaceHolder : 'Eg John Samuel',
            emailPlaceHolder : 'eg xxx@email.com',
            gender : '',
            passwordPlaceHolder : 'A strong password keeps your account safe',
            email: '',
            names: '',
            password: '',
            locationId : false,
            locationPlaceHolder : "Eg Florida, Kampala",
            location : '',
            errorMessage : false,
            locationReturnedList : [],
            locationSearchResult : '',
            dropDown : false,
            selectedLocation : null,
            inputSubmitDisabled : true,
            progressBar : 10,
            message : "By clicking button, your account will be created."
        }
    },
    methods: {
        progress  : function () {
            this.progressBar = ((this.level + 1) / 6) * 100
            if (this.level < 6) {
                if (this.level == 0) {
                    let date = Date.parse(this.dateOfBirth);
                    if (isNaN(date)) {
                        this.errorMessage = "Date formart is invalid. Choose a valid date"
                        return
                    }
                    let age = + new Date(this.dateOfBirth)
                    age = ~~((Date.now() - age) / (31557600000))
                    if (age < 18) {
                        this.errorMessage = "Only 18+ plus are allowed on the platform"
                        return
                    }
                    if (age > 100) {
                        this.errorMessage = "An error occured."
                        return
                    }
                }

                else if(this.level == 1) {
                    if (this.names.length < 2) {
                        this.errorMessage = "Name should be 2 characters and above"
                        return
                    }
                }
                else if(this.level == 2) {
                    if  (! (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(this.email)))
                    {
                        this.errorMessage = "Your email address provided is not valid"
                        return
                    }
                }

                else if(this.level == 5) {
                    if  (this.password.length < 5)
                    {
                        this.errorMessage = "Your password should be atleast 4 characters. Get something memorable please."
                        return
                    }
                }
                this.errorMessage = false
                if (this.level <= 5) {
                    this.inputSubmitDisabled = true
                    this.level++
                }
                if (this.level == 6)
                    this.inputSubmitDisabled = false
            }
            //console.log(this.dateOfBirth)
        },
        watchKeyUps : function (e) {
            if (this[e].replace(/^\s+|\s+$/gm,'').length > 1)
                this.inputSubmitDisabled = false
            else
                this.inputSubmitDisabled = true
        },
        createAccount : function () {
            let vueInstance = this
            this.inputSubmitDisabled = true
            let form = new FormData()
            form.append("email", this.email)
            form.append("names", this.names)
            form.append("password", this.password)
            form.append("dob", this.dateOfBirth)
            form.append("location", this.selectedLocation)
            form.append("gender", this.gender)
            axios({
                method : "post",
                url: "//" + window.location.host + "/new-account",
                data : form
            }).then (function(response){
                vueInstance.message = response.data
            }). catch(function (err) {
                console.log(err)
            })
       },
        matchByLocation : function (e) {
            let vueInstance = this;
            this.inputSubmitDisabled = true;
            let location = this.location;
            if (location.length > 0) {
                let form = new FormData();
                form.append("locationString", location);
                axios({
                    method: 'post',
                    url: "//" + window.location.host + "/search-location",
                    data : form
                }) . then (function (response) {
                   // console.log(response.data)
                    if (response.data) {
                        //console.log( 393939393993)
                        let r = response.data; //Json response
                        //console.log(vueInstance.componentsArray)
                        if (vueInstance.dropDown == false)
                            //vueInstance.view = vueInstance.componentsArray.locationTwo;
                            vueInstance.dropDown = true
                        vueInstance.locationReturnedList = r;
                    } else
                        console.log("Error")
                }).catch(function (error) {
                    console.log(error)
                })
            } else {
                //vueInstance.view = vueInstance.componentsArray.locationOne;
                this.dropDown = false
                this.locationSearchResult = ''
            }
        },
        selectLocation : function(location = false, city = false, country = false){
            //console.log(location)
            this.location = city + " - " + country
            this.selectedLocation = location
            this.inputSubmitDisabled = false
            this.dropDown = false
        },
    },
})