document.addEventListener('DOMContentLoaded', function () {
    //This Code will load Image
    var loadImage = document.getElementById('load');
    function loadInputHandler(event) {
        var imageFile = event.target.files[0];
        var imageElement = document.getElementById('image');
        imageElement.setAttribute('src', URL.createObjectURL(imageFile));
        Caman("#image", function () {
            this.revert();
        });
    };
    loadImage.onchange = loadInputHandler;


    //This Functin will apply the slider effect
    function changeSliderHandler(event) {
        Caman("#image", function renderCaman() {
            //this.revert();
            this[event.target.name](event.target.value).render(function () {
                if (textInput.value) {
                    applyText;
                };
            });
        });
    };

    var ranges = document.querySelectorAll('input[type="range"]');
    ranges.forEach(function (range) {
        range.onchange = changeSliderHandler;
    });

    //THIS IS "RESET BUTTON" HANDLER
    var resetButton = document.getElementById("reset");
    function resetButtonHandler(event) {
        ranges.forEach(function (range) {
            range.value = 0;
        });
        Caman("#image", function () {
            this.revert(true);
        });
    };
    resetButton.onclick = resetButtonHandler;

    //THIS IS "FILTER BUTTON" HANDLER
    function filterButtonHandler(event) {
        Caman('#image', function () {
            this.revert(true);
            this[event.target.id]().render(function () {
                if (textInput.value) {
                    applyText;
                };
            });
        });
    };

    var filterButtons = document.querySelectorAll('.filter');
    filterButtons.forEach(function (filterButton) {
        filterButton.onclick = filterButtonHandler;
    });

    //THIS IS "SAVE BUTTON" HANDLER
    var saveButton = document.getElementById('save');
    function saveButtonHandler(event) {
        Caman('#image', function () {
            this.render(function () {
                applyText;
                this.save('image.jpg');
            });

        });
    };
    saveButton.onclick = saveButtonHandler;


    //THIS IS "APPLY TEXT" EFFECT HANDLER
    var textInput = document.getElementById("message");
    var txtValue = document.getElementById("message").value;
    function applyText() {
        var canvas = document.getElementById('image');
        var ctx = canvas.getContext('2d');
        ctx.fillStyle = "rgba(0,0,0,0.5)";
        var boxTop = (canvas.height / 2) - 30;
        ctx.fillRect(0, boxTop, canvas.width, 65);
        ctx.font = "50px Consolas";
        ctx.fillStyle = 'white';
        ctx.textAlign = 'center';
        ctx.fillText(textInput.value, canvas.width / 2, boxTop + 50);
    };
    var submitText = document.getElementById("submit");

    submitText.onclick = applyText;


    //THIS IS "PREVIEW CROP" BUTTON
    function previewCrop() {
        var width = Number(document.getElementById('width').value);
        var height = Number(document.getElementById('height').value);
        var x = Number(document.getElementById('x').value);
        var y = Number(document.getElementById('y').value);
        var canvas = document.getElementById('image');
        var ctx = canvas.getContext('2d');
        ctx.fillStyle = "rgba(0,0,0,0.5)";
        ctx.fillRect(x, y, width, height);
        setTimeout(function () {
            resetButtonHandler();
        }, 3000);
    };

    var preview = document.getElementById('preview');
    preview.onclick = previewCrop;



    //THIS IS THE "APPLY CROP" BUTTON
    function cropImage() {
        var width = Number(document.getElementById('width').value);
        var height = Number(document.getElementById('height').value);
        var x = Number(document.getElementById('x').value);
        var y = Number(document.getElementById('y').value);
        Caman('#image', function () {
            this.crop(width, height, x, y);
            this.render();
        });
    };

    var crop = document.getElementById('crop');
    crop.onclick = cropImage;

}, false);