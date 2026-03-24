/*
Inputs the hours, below is an example of the JSON sent in
{
    "close_time": "11:59 PM",
    "day_of_week": "MONDAY",
    "id": 57,
    "open_time": "12:00 AM",
    "pantry_id": 9,
    "status": "OPEN"
}
Compares it to the current time on the browser. The current time used in the DB is all in EST so maybe we should convert it in the future but this website is only used for NOVA so we don't need to

Returns a string that saids either "open", "varied", or "closed".
*/
export function getPantryStatus(hours) {
  if (!hours || hours.length === 0) return null;

  const days = [
    "SUNDAY",
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
  ];
  const now = new Date();
  const today = days[now.getDay()];
  const todayHours = hours.find((h) => h.day_of_week === today);

  if (!todayHours || (!todayHours.open_time && !todayHours.close_time))
    return "closed";
  if (!todayHours.open_time || !todayHours.close_time) return "varied";

  const parseTime = (timeStr) => {
    const [time, modifier] = timeStr.split(" ");
    let [h, m] = time.split(":").map(Number);
    if (modifier === "PM" && h !== 12) h += 12;
    if (modifier === "AM" && h === 12) h = 0;
    const d = new Date();
    d.setHours(h, m, 0, 0);
    return d;
  };

  const openTime = parseTime(todayHours.open_time);
  const closeTime = parseTime(todayHours.close_time);

  if (now >= openTime && now < closeTime) return "open";
  return "closed";
}
