##
## PHREEZE ACCESS RULES FOR APACHE
## VERSION 1.3
##

## PHP ERROR REPORTING
# php_flag display_errors 1
# php_value error_reporting 1 # (or 8191 for all errors)
# php_flag asp_tags 0

## PHP SESSION SECURITY
# php_value session.cookie_httponly 1
# php_value session.use_only_cookies 1

## PHP FILE UPLOAD LIMITS
# php_value upload_max_filesize 3M
# php_value post_max_size 3M
# php_value max_execution_time 200
# php_value max_input_time 200

<IfModule mod_rewrite.c>
	Options +FollowSymLinks
	RewriteEngine On
	
	## TODO: some hosts require the app root must be specified
	# RewriteBase /

	# Optionally disable trace request method for security
	# RewriteCond %{REQUEST_METHOD} ^(TRACE|TRACK)
	# RewriteRule .* - [F]
	
	# Redirect all requests to index.php unless the directory, file or link exists
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteCond %{REQUEST_FILENAME} !-d
	RewriteCond %{REQUEST_FILENAME} !-l
	RewriteRule (.*) index.php?_REWRITE_COMMAND=$1 [QSA,L]
</IfModule>

# Add correct mime type for web fonts to supress browser warnings
<IfModule mod_mime.c>
	AddType application/vnd.ms-fontobject eot
	AddType font/opentype otf
	AddType font/truetype ttf
	AddType application/x-font-woff woff
</IfModule>