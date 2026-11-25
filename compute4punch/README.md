# Compute4PUNCH examples

This directory contains REANA serial workflow specifications addressing the Compute4PUNCH (C4P) configuration and notification policies.

## Successful examples

These specifications are expected to pass workflow validation and complete successfully when run on the C4P infrastructure.

| Specification | Description | Expected outcome |
|---|---|---|
| `reana-c4p-cpu-2.yaml` | Request two CPU cores using `c4p_cpu_cores` | Workflow completes successfully |
| `reana-c4p-gpu-1.yaml` | Request one GPU using `c4p_gpu_count` | Workflow completes successfully |
| `reana-c4p-notification-always.yaml` | Set `c4p_notification` to `Always`| Workflow completes successfully and demonstrates the `Always` notification policy |
| `reana-c4p-notification-complete.yaml` | Set `c4p_notification` to `Complete` | Workflow completes successfully and demonstrates the `Complete` notification policy |
| `reana-c4p-notification-never.yaml` | Set `c4p_notification` to `Never` | Workflow completes successfully and demonstrates the `Never` notification policy |
| `reana-c4p-notification-empty.yaml` | `c4p_notification` not specified | Workflow completes successfully and demonstrates the default notification behavior |

## Invalid examples

The following specifications are intentionally invalid or designed to demonstrate execution failure. They are not expected to complete successfully.

| Specification | Description | Expected outcome |
|---|---|---|
| `reana-c4p-cpu-two.yaml` | Specify `two` instead of a valid integer for `c4p_cpu_cores` | Workflow validation rejects the specification, no job is submitted |
| `reana-c4p-gpu-one.yaml` | Specify `one` instead of a valid integer for `c4p_gpu_count` | Workflow validation rejects the specification, no job is submitted |
| `reana-c4p-notification-wrong.yaml` | Use lowercase `always` instead of a valid notification value | Workflow validation rejects the specification, no job is submitted |
| `reana-c4p-execution-error.yaml` | Use `python` rather than `python3` in the execution command | Workflow creation succeeds, but execution fails as `python` is not available in the C4P execution image |

## CI validation

The six successful specifications are included in the serial workflow validation job. They are validated without environment checks, so validation does not require the C4P execution image
or C4P infrastructure. The invalid examples are excluded from the serial workflow validation job because their expected outcomes are validation rejection or execution failure.