String datetimeToDateFormat(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/' // dd/
      '${date.month.toString().padLeft(2, '0')}/' // MM/
      '${(date.year % 100).toString().padLeft(2, '0')}'; // yy
}
