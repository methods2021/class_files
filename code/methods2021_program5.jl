# program to interface with PubMed

# documentation on eutils:
#  https://www.ncbi.nlm.nih.gov/books/NBK25497/

# load the HTTP package
using HTTP

# defines the base eSearch URL
base_search_query = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi"

# create the query query_term
query_term = "\"brown university\"[ad] and \"computational biology\"[mh] and \"smoking\""

# tell user what the query terms are
println("hello, I am going to search for $query_term")

# create parameter dictionary
query_dict = Dict()
query_dict["db"] = "pubmed"
query_dict["term"] = query_term

# send the query to esearch
search_result = String(HTTP.post(base_search_query, body=HTTP.escapeuri(query_dict)))

print(search_result)


# set for storing returned PMIDs
pmid_set = Set()

# pull out the PMIDs from the search result
for result_line in split(search_result, "\n")

    # regular expression to pull out pmid from XML line
    pmid_capture = match(r"<Id>(\d+)<\/Id>", result_line)

    # only push PMID when a match is found
    if pmid_capture != nothing
        push!(pmid_set, pmid_capture[1])
    end

end

println(pmid_set)

# create id string from PMID Set
id_string = join(collect(pmid_set), ",")

println(id_string)

# base URL for efetch
base_fetch_query = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi"

# update parameter dictionary for efetch
query_dict["db"] = "pubmed"
query_dict["id"] = id_string
query_dict["rettype"] = "medline"
query_dict["retmode"] = "text"

# get results for efetch for sent PMIDs (id_string)
fetch_result = String(HTTP.post(base_fetch_query, body=HTTP.escapeuri(query_dict)))

println(fetch_result)

# create dictionary to track MeSH counts
mesh_dict = Dict()

# tabulate the MeSH descriptors in result set
for fetch_line in split(fetch_result, "\n")

    # pull out MeSH descriptor from MEDLINE formatted line
    mesh_capture = match(r"MH  - \*?([^/]+)", fetch_line)

    # increment/create key for MeSH descriptors
    if mesh_capture != nothing
        
        if haskey(mesh_dict, mesh_capture[1])
            mesh_dict[mesh_capture[1]] += 1
        else
            mesh_dict[mesh_capture[1]] = 1
        end

    end

end

# report out MeSH descriptor counts ... only reporting those that occur 2+ times
for mesh_descriptor in keys(mesh_dict)

    if mesh_dict[mesh_descriptor] > 1
        println("$mesh_descriptor occurs $(mesh_dict[mesh_descriptor]) times")
    end
end
