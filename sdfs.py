import requests

def configure_auth(auth_type, value):
    options = {}
    if auth_type == 'digest':
        options['auth'] = requests.auth.HTTPDigestAuth(value[0], value[1])
    elif auth_type == 'ntlm':
        try:
            from requests_ntlm import HttpNtlmAuth
            options['auth'] = HttpNtlmAuth(value[0], value[1])
        except ImportError:
            raise ImportError("Please install the 'requests-ntlm' library to use NTLM authentication.")
    else:
        raise ValueError("Unsupported authentication type.")

    return options

# Example usage
auth_type = 'digest'  # Change to 'ntlm' for NTLM authentication
value = ['username', 'password']

try:
    options = configure_auth(auth_type, value)
    print("Configured options:", options)
except Exception as e:
    print("Error:", e)
