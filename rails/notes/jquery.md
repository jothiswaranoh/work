# jQuery Basics

### Hiding `<p>` Elements on Button Click

```javascript
$(document).ready(function() {
    $("button").click(function() {
        $("p").hide();
    });
});
```

This code hides the `<p>` elements when a button is clicked. You can use `#id` and `.classname` to select specific elements.

## jQuery Events

### Examples of jQuery Events

```javascript
// Double click event
$("element").dblclick(function() {
    // Code for double click event
});

// Mouseenter event
$("element").mouseenter(function() {
    // Code for mouseenter event
});

// Mouseleave event
$("element").mouseleave(function() {
    // Code for mouseleave event
});

// Mousedown event
$("element").mousedown(function() {
    // Code for mousedown event
});

// Mouseup event
$("element").mouseup(function() {
    // Code for mouseup event
});

// Hover event
$("element").hover(
    function() {
        console.log("Mouse entered.");
    },
    function() {
        console.log("Mouse left.");
    }
);
```

### Handling Multiple Events with `.on()`

```javascript
// Using .on() to handle multiple events
$("element").on("click mouseenter", function() {
    console.log("Mouse entered or clicked.");
});

// Using .on() with multiple events and event-specific functions
$("element").on({
    click: function() {
        console.log("Clicked.");
    },
    mouseover: function() {
        console.log("Mouse over.");
    }
});

// Disabling a specific event using .off()
$("element").off("click");

// Using .one() to execute a function only once
$("element").one("click", function() {
    console.log("This will execute only once.");
});
```

## Animations in jQuery

### Hiding and Showing Elements

```javascript
$("img").hide("slow"); // Hide image with a slow animation
$("img").show("fast"); // Show image with a fast animation
```

### Sliding Elements

```javascript
$("h1").slideUp(500); // Slide up an h1 element
$("h1").slideDown(500); // Slide down an h1 element
```

### Using Fade Effects

```javascript
// Using fade methods
$("element").fadeOut(2000);
$("element").fadeIn(2000);
$("element").fadeToggle(2000);

// Adding a class to an element
$("h1").fadeIn(2000, function() {
    $(this).addClass("blue");
});

// Using delay with animations
$("p").hide(500).delay(1000).show(300);
```

## DOM Manipulation using jQuery

### Retrieving and Changing Element Content

```javascript
$("#btn").click(function() {
    console.log($("#test").text()); // Get and log the text inside an element
});

console.log($("#fcc").attr("href")); // Get and log the "href" attribute of an element
```

### Modifying Text Content with a Function

```javascript
$("#btn2").click(function() {
    $("p").text(function(i, origText) {
        return "Old text: " + origText + " New text: freeCodeCamp is awesome! (index: " + i + ")";
    });
});
```

### Animating Elements with Callbacks

```javascript
$("#go").click(function() {
    $("#block").animate({
        opacity: 0.5,
        marginLeft: "+=50",
        height: "400px"
    }, 3000, "linear", function() {
        $(this).after("<div>Animation complete.</div>");
    });
});

$("#go").click(function() {
    $("#block").animate({ 
        width: "90%"
    }, 1000)
    .animate({
        fontSize: "40px"
    }, 1000)
    .animate({
        borderLeftWidth: "30px"
    }, 1000);
});
