import { Controller } from "@hotwired/stimulus"
// "arrow_left", "arrow_right",
// Connects to data-controller="flashcards-handler"
export default class extends Controller {
  static targets = ["show", "text"]
  connect() {

    console.log ("controller OK"); 
    this.showingQuestion = true;
    this.currentIndex = 0;
    this.flashcards = this.getFlashcardsData();
    this.syncState();
  }

  getFlashcardsData() {
    return JSON.parse(this.element.dataset.flashcards || "[]");
  }

  syncState() {
    
    const currentFlashcard = this.flashcards[this.currentIndex];
    if (!currentFlashcard) return;

    this.textTarget.dataset.question = currentFlashcard.question;
    this.textTarget.dataset.answer = currentFlashcard.answer;
    this.textTarget.innerHTML = currentFlashcard.question;
    
    this.showTarget.setAttribute("data-icon", "eye");
    this.showTarget.innerHTML = this.getIconSvg("eye");

    this.showingQuestion = true; 
  }

  show(){
    // const currentFlashcard = this.flashcards[this.currentIndex];
    // if (!currentFlashcard) return;

    console.log("show !");
    const currentIcon = this.showTarget.getAttribute("data-icon");
    const newIcon = currentIcon === "eye" ? "eye-off" : "eye" ;

    this.showTarget.setAttribute("data-icon", newIcon);
    this.showTarget.innerHTML = this.getIconSvg(newIcon);

    this.textTarget.innerHTML = this.showingQuestion 
    ? this.textTarget.dataset.answer 
    : this.textTarget.dataset.question;

    this.showingQuestion = !this.showingQuestion;
  }



  previousQuestion() {
if (this.currentIndex > 0) {
  this.currentIndex--;
  this.syncState();
} else {
  console.log("First Flashcard");
  }
}

nextQuestion() {
  if (this.currentIndex < this.flashcards.length -1) {
    this.currentIndex++;
    this.syncState();
  } else {
    console.log("Last Flashcard");
    }
  }

  getIconSvg(name) {
    const icons = {
       "eye": `<svg class="h-6 w-6 item-center justify-center"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-eye"><path d="M2.062 12.348a1 1 0 0 1 0-.696 10.75 10.75 0 0 1 19.876 0 1 1 0 0 1 0 .696 10.75 10.75 0 0 1-19.876 0"/><circle cx="12" cy="12" r="3"/></svg>`,
      "eye-off": `<svg class="h-6 w-6 item-center justify-center"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-eye-closed"><path d="m15 18-.722-3.25"/><path d="M2 8a10.645 10.645 0 0 0 20 0"/><path d="m20 15-1.726-2.05"/><path d="m4 15 1.726-2.05"/><path d="m9 18 .722-3.25"/></svg>`
    };
    return icons[name] || "";
  }
}

