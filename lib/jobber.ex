defmodule Jobber do
  alias Jobber.{JobRunner, JobSupervisor, Job}

  def start_job(args) do
    if Enum.count(Job.running_imports() >= 5) do
      {:error, :import_limit_reached}
    else
      DynamicSupervisor.start_child(JobRunner, {JobSupervisor, args})
    end
  end
end
