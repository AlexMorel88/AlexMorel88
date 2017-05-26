class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.confirm.subject
  #
  def confirm(booking)
    @booking = booking

    mail(
      to:       @booking.user.email,
      subject:  "Confirmation de votre réservation du #{@booking.start_date} au #{@booking.end_date} sur le bon vignoble"
    )
  end
end
