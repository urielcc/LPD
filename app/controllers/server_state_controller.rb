class ServerStateController < ApplicationController
  def index
  	memory_usages = `ps -A -o rss=`.split("\n")
	total_mem_usage = memory_usages.inject { |a, e| a.to_i + e.strip.to_i }
	total_memory_usage_in_k = `ps -Ao rss=`.split.map(&:to_i).inject(&:+)
  	puts total_mem_usage
  	#puts memory_usages
  	render :xml => {:ram => total_mem_usage}.to_xml
  end
end
