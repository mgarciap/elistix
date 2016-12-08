defmodule Elistix.Query do
  @moduledoc """
  This module makes all the operations related to the query in ES.

  All the functions receive an attribute 'query' that is a JSON (the same you
  can copy from the ElasticSearch docs).
  """

  @doc """
  To search by any query.
  Attributes are two strings with the name of the index and the type and the
  third attribute is a JSON string that contains the query you want to execute.
  '{
     "query" : {
       "multi_match" : {
         "query" : "params["q"]",
         "fields" : ["field_one", "field_two"]
       }
     }
   }'
  """
  def search(name, type, query) do
    Elistix.request(:get, "/#{name}/#{type}/_search", query)
  end
end
