# from <http://stackoverflow.com/questions/7116038>

error_message = """
\033[91mError:\033[0m unable to import readline bindings.
You may need to `pip install readline rlcompleter`."""

try:
    import readline
    import rlcompleter
    if 'libedit' in readline.__doc__:
        readline.parse_and_bind("bind ^I rl_complete")
    else:
        readline.parse_and_bind("tab: complete")
except ImportError as e:
    print(error_message)
    print(e)
