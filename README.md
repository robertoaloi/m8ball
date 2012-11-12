# m8ball

m8ball example from Learn You Some Erlang
http://learnyousomeerlang.com/distributed-otp-applications

## Quickstart

Compile the code base:

    make

Available commands (one-node mode):

    make rel
    make start
    make ping
    make attach
    make stop
    make console

Available commands (multi-node mode):

    make rel_all
    make start_all
    make ping_all
    make attach_a
    make attach_b
    make attach_c
    make stop_all
    make console_a
    make console_b
    make console_c

Ask a question to the Magic Ball Server:

        m8ball_server:ask("What is the weather like?").

To know how many questions have been asked:

    folsom_metrics:get_metric_value("counter").
