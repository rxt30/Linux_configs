import i3ipc
import argparse

I3 = i3ipc.Connection()
parser = argparse.ArgumentParser()
parser.add_argument(
    "-b", "--back", action="store_true", help="Select previous workspace"
)
parser.add_argument(
    "-c", "--container", action="store_true", help="Move container to workspace"
)
ARGS = parser.parse_args()


def get_ws():
    global I3
    all_ws = sorted(I3.get_workspaces(), key=lambda x: x.num)
    focused_ws = list(filter(lambda x: x.focused, all_ws))[0]
    monitor_ws = list(filter(lambda x: x.output == focused_ws.output, all_ws))
    return all_ws, monitor_ws, focused_ws


def get_number_of_next_ws(all_ws, focused_monitor_ws, focused_ws):
    global ARGS
    all_ws_num = [ws.num for ws in all_ws]
    focused_monitor_ws_num = [ws.num for ws in focused_monitor_ws]
    num_filter = (
        (lambda x: x.num < focused_ws.num)
        if ARGS.back
        else (lambda x: x.num > focused_ws.num)
    )
    next_msg = "move container to " if ARGS.container else ""
    position_current_ws = list(filter(num_filter, focused_monitor_ws))
    if ARGS.back:
        next_num = max(
            set(range(0, focused_ws.num))
            - (set(all_ws_num) - set(focused_monitor_ws_num))
        )
    else:
        next_num = min(
            set(range(focused_ws.num + 1, max(all_ws_num) + 2))
            - (set(all_ws_num) - set(focused_monitor_ws_num))
        )
    return next_msg + f"workspace {next_num}"


if __name__ == "__main__":
    all_ws, monitor_ws, focused_ws = get_ws()
    next_msg = get_number_of_next_ws(all_ws, monitor_ws, focused_ws)
    I3.command(next_msg)
