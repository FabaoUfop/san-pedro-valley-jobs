xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "San Pedro Valley Jobs"
    xml.description "Últimas vagas cadastradas no SPV Jobs"
    xml.link root_path

    for job in @jobs
      xml.item do
        xml.title job.title
        xml.description job.description
        xml.pubDate job.updated_at.to_s(:rfc822)
        xml.link company_job_url(job.company, job)
        xml.guid company_job_url(job.company, job)
      end
    end
  end
end
