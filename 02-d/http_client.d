module http_client;

import std.stdio; // reading/writing from stdin/stdout
import std.json; // parsing JSON
import std.string; // string functions (like stripping whitespace)
import std.net.curl; // http requests

void main(string[] args) {
	write("What's your Github username? ");
	string username = strip(readln());
	
	auto response = get("https://api.github.com/users/" ~ username); // http GET request
	JSONValue api = parseJSON(response); // turning the response into a JSONValue

	writefln("Your user ID is %s",			api["id"]); // and using values from the JSONValue
	writefln("Your biography is %s",		api["bio"]);
	writefln("You have %s public repos",	api["public_repos"]);
	writefln("You have %s public gists",	api["public_gists"]);
	writefln("You have %s followers",		api["followers"]);
	writefln("You are following %s people", api["following"]);
}
