############################################################
# VAULT CLIENT
############################################################

import hvac
import psycopg2

############################################################
# VAULT CONNECTION
############################################################

client = hvac.Client(
    url='http://vault:8200',
    token='root'
)

############################################################
# READ POSTGRES SECRET
############################################################

secret = client.secrets.kv.v2.read_secret_version(
    path='postgres',
    mount_point='secret'
)

username = secret['data']['data']['username']
password = secret['data']['data']['password']

############################################################
# CONNECT DATABASE
############################################################

conn = psycopg2.connect(
    dbname="epidemiologie",
    user=username,
    password=password,
    host="postgres"
)

print("Database connected securely")

############################################################
# READ TELEGRAM TOKEN
############################################################

telegram_secret = client.secrets.kv.v2.read_secret_version(
    path='telegram',
    mount_point='secret'
)

bot_token = telegram_secret['data']['data']['bot_token']

print("Telegram token loaded securely")