module JobsHelper
  def render_job_status(job)
    if job.is_hidden
      fa_icon "lock lg"
    else
      fa_icon "globe lg"
    end
  end
end
