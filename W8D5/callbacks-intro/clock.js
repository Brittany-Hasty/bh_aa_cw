class Clock {
    constructor() {
        // 1. Create a Date object.
        this.date = new Date();
        // 2. Store the hours, minutes, and seconds.
        this.hours = this.date.getHours();
        this.minutes = this.date.getMinutes();
        this.seconds = this.date.getSeconds();
        // 3. Call printTime.
        this.printTime(); 
        // 4. Schedule the tick at 1 second intervals.
        console.log("in constructor:", this);
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        console.log(this.hours + ":" + this.minutes + ":" + this.seconds);
    }

    _tick() {
        // 1. Increment the time by one second.
        // 2. Call printTime.

        console.log("in function:", this);

        this.seconds += 1;

        if (this.seconds/59 > 1) {
            this.minutes += 1;
            this.seconds = 0; 
        } 

        if (this.minutes/59 > 1) {
            this.hours += 1;
            this.minutes = 0;
        }
        if (this.hours/12 > 1) { 
            this.hours = this.hours % 12;
        }
        this.printTime();
    }
}

const clock = new Clock();