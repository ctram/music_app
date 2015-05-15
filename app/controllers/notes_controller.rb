class NotesController < ApplicationController

  def create
    byebug
    @note = Note.new(note_params)
    @user = current_user
    @track = Track.find(params[:id])
    @note.user = @user

    if @note.save

    else
      render
      flash.now[:errors] = @track.errors.full_messages
    end

  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
