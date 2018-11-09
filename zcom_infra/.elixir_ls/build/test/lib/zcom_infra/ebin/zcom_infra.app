{application,zcom_infra,
             [{applications,[kernel,stdlib,elixir,logger,httpoison,json,
                             cowboy,plug]},
              {description,"zcom_infra"},
              {modules,['Elixir.ZcomInfra','Elixir.ZcomInfra.Endpoints',
                        'Elixir.ZcomInfra.Filter',
                        'Elixir.ZcomInfra.Plug.VerifyRequest',
                        'Elixir.ZcomInfra.Plug.VerifyRequest.IncompleteRequestError']},
              {registered,[]},
              {vsn,"0.1.0"},
              {mod,{'Elixir.ZcomInfra',[]}},
              {env,[{comboy_port,8080}]}]}.