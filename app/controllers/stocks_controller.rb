# controller for stocks
class StocksController < ActionController
  require 'csv'

  def create
    stream = params['attachment-1']
    data = stream.read()
    File.open('0.xls', "wb") do |file|
      file.write(data)
    end
    xls = Spreadsheet.open('./0.xls')
    periods = [[3, 7, 14], [31, 92, 365]]
    forecast = {}
    date = Date.today
    2.times do |s|
      sheet = xls.worksheet(s)
      date = sheet.row(0)[8].to_date.to_s
      100.times do |i|
        18.times do |j|
          next if [0, 6, 12].include? j
          symbol_row = sheet.row(3*i+5)
          symbol = symbol_row.at(j)
          next if symbol.blank?
          symbol = 'SPY' if symbol == '^S&P500'
          signal_row = sheet.row(3*i+6)
          signal = signal_row.at(j)
          pred_row = sheet.row(3*i+7)
          pred = pred_row.at(j)
          period = periods[s][j/6]
          forecast[symbol] = {} if forecast[symbol].blank?
          forecast[symbol]["signal#{period}"] = signal
          forecast[symbol]["pred#{period}"] = pred
        end
      end
    end
    forecast.each do |symbol, values|
      stock = Stock.find_or_create_by(symbol: symbol, date: date)
      update_attributes = {}
      periods.flatten.each do |period|
        update_attributes["signal#{period}"] = values["signal#{period}"]
        update_attributes["pred#{period}"] = values["pred#{period}"]
      end
      stock.update_attributes(update_attributes.symbolize_keys)
    end
    render json: {success: true}
  rescue StandardError => e
    Rollbar.logs('error', e)
    render json: {success: false, error: {message: e.message, backtrace: e.backtrace}}, status: 400
  end

end
