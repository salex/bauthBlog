module HomeHelper
  def distance_between_dates_in_years_months(date1,date2=Date.today)
    diff = (date2 + 1.day) - date1
    decimal_years = diff / 365.25
    years = decimal_years.to_i 
    decimal_months = ((decimal_years - years) * 12).round(2)
    months = decimal_months.to_i 
    days =  ((decimal_months - months) * 30.405).to_i
    # return ("About #{years} year, #{decimal_months} months, #{days } days ago")
    return {years:years, months:months, dmonths:decimal_months,days:days}
  end

end
