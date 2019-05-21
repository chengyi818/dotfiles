"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const datefns = require("date-fns");
const Utils = require("./utils");
const weekdayArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
function parseDate(dateString) {
    const dateRegExp = /(\d{4})-(\d{1,2})-(\d{1,2})/;
    const dateResult = dateRegExp.exec(dateString);
    let year, month, day;
    if (dateResult) {
        year = parseInt(dateResult[1]);
        month = parseInt(dateResult[2]);
        day = parseInt(dateResult[3]);
    }
    const weekdayRegExp = /[A-Za-z]{3}/;
    const weekdayResult = weekdayRegExp.exec(dateString);
    let weekday;
    if (weekdayResult) {
        weekday = weekdayResult[0];
    }
    return { year, month, day, weekday };
}
exports.parseDate = parseDate;
;
function isValidSimpleDate(datetime) {
    return Boolean(datetime.year) && Boolean(datetime.month) && Boolean(datetime.day);
}
exports.isValidSimpleDate = isValidSimpleDate;
function buildDateString(datetime) {
    const { year, month, day, weekday } = datetime;
    let dateString = `${year}-${month}-${day}`;
    if (Utils.getLeftZero()) {
        dateString = padDate(dateString);
    }
    if (weekday) {
        dateString = `${dateString} ${weekday}`;
    }
    return `[${dateString}]`;
}
exports.buildDateString = buildDateString;
;
function buildDateTimeString(datetime) {
    const { year, month, day, hours, minutes, weekday } = datetime;
    let dateString = `${year}-${month}-${day}`;
    let timeString = `${hours}:${minutes}`;
    if (Utils.getLeftZero()) {
        dateString = padDate(dateString);
        timeString = padTime(timeString);
    }
    if (weekday) {
        dateString = `${dateString} ${weekday}`;
    }
    return `[${dateString} ${timeString}]`;
}
exports.buildDateTimeString = buildDateTimeString;
;
function padDate(str) {
    let regex = /-(\d)(-|$)/;
    while (regex.exec(str) !== null) {
        str = str.replace(regex, '-0$1$2');
    }
    return str;
}
function padTime(str) {
    let regex = /(^|:)(\d)(:|$)/;
    while (regex.exec(str) !== null) {
        str = str.replace(regex, '$10$2$3');
    }
    return str;
}
function dateToSimpleDate(dateObject) {
    const year = dateObject.getFullYear();
    const month = dateObject.getMonth() + 1; // Why, Javascript, why!?
    const day = dateObject.getDate();
    const weekday = weekdayArray[dateObject.getDay()];
    return {
        year,
        month,
        day,
        weekday
    };
}
exports.dateToSimpleDate = dateToSimpleDate;
function dateToSimpleDateTime(dateObject) {
    let simpleDateTime = dateToSimpleDate(dateObject);
    simpleDateTime.hours = dateObject.getHours();
    simpleDateTime.minutes = dateObject.getMinutes();
    return simpleDateTime;
}
exports.dateToSimpleDateTime = dateToSimpleDateTime;
function currentDate() {
    const currentDate = new Date();
    return dateToSimpleDate(new Date());
}
exports.currentDate = currentDate;
function currentDateTime() {
    const currentDate = new Date();
    return dateToSimpleDateTime(new Date());
}
exports.currentDateTime = currentDateTime;
function modifyDate(dateString, action) {
    const oldDate = parseDate(dateString);
    let dateObject = datefns.parse(`${oldDate.year}-${oldDate.month}-${oldDate.day}`);
    if (action === "UP") {
        dateObject = datefns.addDays(dateObject, 1);
    }
    else {
        dateObject = datefns.addDays(dateObject, -1);
    }
    const newDate = dateToSimpleDate(dateObject);
    if (!oldDate.weekday) {
        newDate.weekday = undefined;
    }
    return buildDateString(newDate);
}
exports.modifyDate = modifyDate;
function getClockTotal(line) {
    const separator = Utils.getClockTotalSeparator();
    const regex = /\d{1,2}:\d{1,2}/g;
    const match = line.match(regex);
    if (match.length < 2)
        return '';
    const clockIn = new Date(`2017-01-01 ${match[0]}`);
    const clockOut = new Date(`2017-01-01 ${match[1]}`);
    const clock = clockOut.getTime() - clockIn.getTime();
    const hours = Math.floor(clock / (60 * 60 * 1000));
    const minutes = clock / (60 * 1000) - (60 * hours);
    let clockString = `${hours}:${minutes}`;
    if (Utils.getLeftZero()) {
        clockString = padTime(clockString);
    }
    return clockString;
}
exports.getClockTotal = getClockTotal;
//# sourceMappingURL=simple-datetime.js.map