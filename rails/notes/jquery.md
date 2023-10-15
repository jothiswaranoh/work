# jquery and its basics

## Hiding Elements on Button Click
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
    console.log($("#test").html()); // Get and log the HTML content inside an element
    console.log($("#test").attr("href")); // Get and log the "href" attribute of an element
    console.log($("#test").val()); // Get and log the value of an element
});
```

### Modifying Text Content with a Function
```javascript
$("#btn2").click(function() {
    $("#test").text(function(i, origText) {
        return "Old text: " + origText + " New text: freeCodeCamp is awesome! (index: " + i + ")";
    });
});
```

### Adding and Removing DOM Elements
```javascript
$("#btn3").click(function() {
    $("<p>Appended paragraph</p>").appendTo("body"); // Append a paragraph to the body
    $("<p>Prepended paragraph</p>").prependTo("body"); // Prepend a paragraph to the body
    $("<p>Before paragraph</p>").insertBefore("#target"); // Insert a paragraph before the target element
    $("<p>After paragraph</p>").insertAfter("#target"); // Insert a paragraph after the target element
    $("p").remove(); // Remove all paragraphs
    $("#container").empty(); // Empty the content of the container
});
```

### Add and Remove CSS Classes
```javascript
$("#btn4").click(function() {
    $("p").addClass("highlight"); // Add the 'highlight' class to all paragraphs
    $("p").removeClass("highlight"); // Remove the 'highlight' class from all paragraphs
});
```

### DOM Traversal - Finding Parent and Child Nodes
```javascript
$("li").parent().css({"color": "chocolate", "border": "2px solid chocolate"});
$("li").parents().css({"color": "chocolate", "border": "2px solid chocolate"});
$("li").parentsUntil("ul").css({"color": "chocolate", "border": "2px solid chocolate"});
$("ul").children().css({"color": "chocolate", "border": "2px solid chocolate"});
$("ul").find("li").css({"color": "chocolate", "border": "2px solid chocolate"});
$("ul").find("*").css({"color": "chocolate", "border": "2px solid chocolate"});
$("li").siblings().css({"color": "chocolate", "border": "2px solid chocolate"});
$("li").next().css({"color": "chocolate", "border": "2px solid chocolate"});
$("li").nextAll().css({"color": "chocolate", "border": "2px solid chocolate"});
$("li").nextUntil("li:last").css({"color": "ch

ocolate", "border": "2px solid chocolate"});
```

## AJAX in jQuery

### Sending POST Request with `$.post`
```javascript
function loadDoc() {
    $.post("https://cors-anywhere.herokuapp.com/http://carnes.cc/code/ajax_example.txt", {
        name: "Beau Carnes",
        city: "Grand Rapids"
    }, function(data, status) {
        console.log("Data: " + data + "\nStatus: " + status);
    });
}
```

### Using `$.ajax` for More Control
```javascript
$.ajax('https://some.url', {
    success: (data) => {
        // Handle the response data in the success callback
        console.log("Data: " + data);
    },
    error: (xhr, status, error) => {
        // Handle errors
        console.log("Error: " + xhr.status + ": " + xhr.statusText);
    }
});
