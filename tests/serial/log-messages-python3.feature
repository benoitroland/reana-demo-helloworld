# Tests for the expected log messages for C4P workflows

Feature: Log messages C4P

    As a researcher,
    I want to be able to see the log messages of my workflow execution,
    So that I can verify that the workflow ran correctly.

    Scenario: The workflow start has produced the expected messages
        When the workflow is finished
        Then the engine logs should contain "Publishing step:0, cmd: python3 "code/helloworld.py""
