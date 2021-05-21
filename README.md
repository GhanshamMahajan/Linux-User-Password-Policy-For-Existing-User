# Linux-User-Password-Policy-For-Existing-User
I have created the script which can apply the Password policy to existing users.
Many times we have apply the password policy to the user using /etc/login.def file but we have to manully apply those policy for existing users. This script will help you to apply same policy to existing user.

I am collecting all the users who have bash shell and I am excluding some of the application users.

cat /etc/passwd | grep 'bash' | cut -d: -f1 | grep -ivw -e 'utadmin' -e 'otisadmin' -e 'otisuser' -e 'nxautomation' -e 'omsagent'

Here is the policy set. Maximum password age = 90 days, Minimum Password age = 1 days, Warning password = 7 days

chage -M 90 -m 1 -W 7 mahajag-a
