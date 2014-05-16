post_export()
{
    LOGIN_ID="your student id"
    PASSWORD="your password"

    TP_ENV_NAME="Titech" # u should fix this

    TP_LOGIN_URL="https://wlanauth.noc.titech.ac.jp/login.html"

    # login
    CURL_RESULT=$(curl $TP_LOGIN_URL -X POST -d buttonClicked=4 -d "username=$LOGIN_ID&password=$PASSWORD" 2>&1)
    # parse 
    STATUS_CODE=` echo $CURL_RESULT | grep 'statusCode' | sed -e 's/^.*[statusCode=]//g' -e 's/".*//g'`
    case $STATUS_CODE in
        1) echo "You are already logged in.";;
            # u are already logged in.
        2) echo "You needn't authenticate against web portal.";;
            # u needn't authenticate against web portal..
        3) echo "Your account specified cannnot be used now. Perhaps already logged into the system (by other device).";;
            # ur account specified cannnot be used now. Perhaps already logged into the system.
        4) echo "Your account has been excluded. Please contact the Admin.";;
            # ur account has been excluded.
        5) echo "Invalid your account. Rewrite your information.";;
            # invalid username and password.
        *) echo "Auto log-in is successful.";; # break 
           # no session. successful
    esac

    scselect $TP_ENV_NAME
}