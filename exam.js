let currentQuestionIndex = 0;
let questions = [];

// Fetch questions from the server
fetch('fetch_questions.php')
    .then(response => response.json())
    .then(data => {
        questions = data;
        displayQuestion();
    })
    .catch(error => {
        console.error('Error fetching questions:', error);
    });

function displayQuestion() {
    if (currentQuestionIndex < questions.length) {
        const questionBox = document.getElementById('question-box');
        const question = questions[currentQuestionIndex];
        
        questionBox.innerHTML = `
            <div class="question">${currentQuestionIndex + 1}. ${question.question_text}</div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="question${currentQuestionIndex}" id="optionA" value="A">
                <label class="form-check-label" for="optionA">${question.option_a}</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="question${currentQuestionIndex}" id="optionB" value="B">
                <label class="form-check-label" for="optionB">${question.option_b}</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="question${currentQuestionIndex}" id="optionC" value="C">
                <label class="form-check-label" for="optionC">${question.option_c}</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="question${currentQuestionIndex}" id="optionD" value="D">
                <label class="form-check-label" for="optionD">${question.option_d}</label>
            </div>
        `;
    } else {
        alert("You have completed the exam!");
        // Here you can redirect to a results page or handle the end of the exam
    }
}

function nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        displayQuestion();
    } else {
        alert("This is the last question.");
    }
}

function goBack() {
    if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
        displayQuestion();
    } else {
        alert("This is the first question.");
    }
}

function exitExam() {
    if (confirm("Are you sure you want to exit the exam?")) {
        window.location.href = 'dashboard.php'; // Redirect to the dashboard
    }
}