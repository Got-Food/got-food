/**
 * Determines the open/closed/varied status of a pantry based on its hours.
 *
 * @param {Object} pantry - The pantry object containing hours and has_variable_hours.
 * @param {string} todayName - The current day name, from getCurrentDay().
 * @returns {"open" | "closed" | "varied"}
 */
export function getOpenStatus(pantry, todayName) {
  if (pantry.has_variable_hours) return "varied";

  const todayHours = pantry.hours?.find((h) => h.day_of_week === todayName);
  if (!todayHours || todayHours.status === "CLOSED") return "closed";

  if (
    todayHours.status !== "OPEN" &&
    !todayHours.open_time &&
    !todayHours.close_time
  )
    return "closed";

  if (!todayHours.open_time) return "open";

  const now = new Date();
  const toMinutes = (timeStr) => {
    const [time, meridiem] = timeStr.split(" ");
    let [h, m] = time.split(":").map(Number);
    if (meridiem === "PM" && h !== 12) h += 12;
    if (meridiem === "AM" && h === 12) h = 0;
    return h * 60 + m;
  };

  const nowMinutes = now.getHours() * 60 + now.getMinutes();
  const openMinutes = toMinutes(todayHours.open_time);
  const closeMinutes = todayHours.close_time
    ? toMinutes(todayHours.close_time)
    : Infinity;

  return nowMinutes >= openMinutes && nowMinutes < closeMinutes
    ? "open"
    : "closed";
}

export const STATUS_LABELS = {
  open: "Open",
  closed: "Closed",
  varied: "Hours Varied",
};
