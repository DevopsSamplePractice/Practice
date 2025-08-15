#!/bin/bash
###############
#Author:Harsh Kushwaha
#Description: This script is for listing the users having access to any github repo of any organization
#Date:12/08/2025
# Version: v1.01
# 
# Prerequisites: Before executing the script execute the following commands:
# export username="Your_username"
# export token="Your_github_classic_token"
#
#Command to run the script:"./list_users.sh <Repo_owner> <Repo_name>"
#
# In case of issues contact: "https://www.linkedin.com/in/harsh-kushwaha-613689219/"
################

read_full_script()

#GitHUB API url
API_URL="https://api.github.com"

#GitHUB username and token
#
USERNAME=$username
TOKEN=$token

#Repo owner and repo name
#
Repo_owner=$1
Repo_name=$2

#function to create the get request to github api
function github_get_api {
	local endpoint="$1"
	local url="${API_URL}/${endpoint}"

# this is the get request to the github api
	curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

#function to list the users having read access of repo
#
function list_users_read_access {
	local endpoint="repos/${Repo_owner}/${Repo_name}/collaborators"
#this fetches the list of users with read access to the repository
collaborators="$(github_get_api "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

# conditions to display if user have read access 

	if [[ -z "$collaborators" ]]; then
		echo "No users with read access found for ${Repo_owner}/${Repo_name}."
	else 
		echo "Users with read access to ${Repo_owner}/${Repo_name}:"
		echo "$collaborators"
	fi
}
#
function read_full_script{
	expected_args=2
	if [$# -ne $expected_args]; then
		echo "Bro..!! you haven't read the script executing command given above, it's ok!! Please pass the expected cmd args"
		echo "Args: Repo_onwer Repo_name"
	}
#
# Main script to show list of users with read access
#
echo "Listing users with read access to ${Repo_owner}/${Repo_name}..."
list_users_read_access
