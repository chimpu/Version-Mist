<?php 
class Chimpu_seo
{
	private $url;
	private $str; 
	
	
	function seo_url($url)
	{		
		if($url=="seo")
		{
			
		$str='RewriteEngine On
		RewriteRule ^([a-zA-Z0-9_-]+)$ index.php?username=$1
		RewriteRule ^([a-zA-Z0-9_-]+)/$ index.php?username=$1		
		Header unset Pragma
		FileETag None
		Header unset ETag
		
		Options All -Indexes
		
		RewriteEngine On
		
		# compress text, html, javascript, css, xml:
		AddOutputFilterByType DEFLATE text/plain
		AddOutputFilterByType DEFLATE text/html
		AddOutputFilterByType DEFLATE text/xml
		AddOutputFilterByType DEFLATE text/css
		AddOutputFilterByType DEFLATE application/xml
		AddOutputFilterByType DEFLATE application/xhtml+xml
		AddOutputFilterByType DEFLATE application/rss+xml
		AddOutputFilterByType DEFLATE application/javascript
		AddOutputFilterByType DEFLATE application/x-javascript
		
		
		
		
		# block visitors referred from indicated domains
		<IfModule mod_rewrite.c>
		SetEnvIfNoCase ^User-Agent$ .*(craftbot|download|extract|stripper|sucker|ninja|clshttp|webspider|leacher|collector|grabber|webpictures) HTTP_SAFE_BADBOT
		SetEnvIfNoCase ^User-Agent$ .*(libwww-perl|aesop_com_spiderman) HTTP_SAFE_BADBOT
		Deny from env=HTTP_SAFE_BADBOT
		</ifModule>
		
		# proc/self/environ? no way!
		RewriteCond %{QUERY_STRING} proc/self/environ [OR]
		
		# Block out any script trying to set a mosConfig value through the URL
		RewriteCond %{QUERY_STRING} mosConfig_[a-zA-Z_]{1,21}(=|\%3D) [OR]
		
		# Block out any script trying to base64_encode crap to send via URL
		RewriteCond %{QUERY_STRING} base64_encode.*(.*) [OR]
		
		# Block out any script that includes a <script> tag in URL
		RewriteCond %{QUERY_STRING} (<|%3C).*script.*(>|%3E) [NC,OR]
		
		# Block out any script trying to set a PHP GLOBALS variable via URL
		RewriteCond %{QUERY_STRING} GLOBALS(=|[|\%[0-9A-Z]{0,2}) [OR]
		
		# Block out any script trying to modify a _REQUEST variable via URL
		RewriteCond %{QUERY_STRING} _REQUEST(=|[|\%[0-9A-Z]{0,2})
		
		# Send all blocked request to homepage with 403 Forbidden error!
		RewriteRule ^(.*)$ index.php [F,L]
		
		
		<FilesMatch ".(flv|gif|jpg|jpeg|png|ico|swf|js|css|pdf)$">
		Header set Cache-Control "max-age=2592000"
		</FilesMatch>
		
		
		<FilesMatch "\.(ico|jpg|jpeg|png|gif|js|css|swf|pdf|flv|mp3)$">
		<IfModule mod_expires.c>
		ExpiresActive on
		ExpiresDefault "access plus 14 days"
		Header set Cache-Control "public"
		</IfModule>
		</FilesMatch>
		<FilesMatch "\.(html|htm|xml|txt|xsl)$">
		Header set Cache-Control "max-age=7200, must-revalidate"
		</FilesMatch>
		
		
		
		
		
		<ifmodule mod_deflate.c="">
		<filesmatch ".(js|css|jpg|gif|png|tiff|ico)$"="">
		SetOutputFilter DEFLATE
		</filesmatch>
		</ifmodule>
		
		FileETag MTime Size
		ExpiresActive on
		ExpiresDefault "access plus 86400 seconds"
		
		#Protect the .htaccess File
		<files .htaccess="">
		order allow,deny
		deny from all
		</files>
		
		AddOutputFilterByType DEFLATE text/html text/plain text/xml application/xml application/xhtml+xml text/javascript text/css application/x-javascript
		BrowserMatch ^Mozilla/4 gzip-only-text/html
		BrowserMatch ^Mozilla/4.0[678] no-gzip
		
		BrowserMatch bMSIE !no-gzip !gzip-only-text/html
		
		ErrorDocument 401 /error/401.php
		ErrorDocument 403 /error/403.php
		ErrorDocument 404 /error/404.php
		ErrorDocument 500 /error/500.php
		
		
		
		# 480 weeks
		<FilesMatch "\.(ico|pdf|flv|jpg|jpeg|png|gif|js|css|swf)$">
		Header set Cache-Control "max-age=290304000, public"
		</FilesMatch>
		
		# 2 DAYS
		<FilesMatch "\.(xml|txt)$">
		Header set Cache-Control "max-age=172800, public, must-revalidate"
		</FilesMatch>
		
		# 2 HOURS
		<FilesMatch "\.(html|htm)$">
		Header set Cache-Control "max-age=7200, must-revalidate"
		</FilesMatch>
		
		<ifModule mod_gzip.c>
		mod_gzip_on Yes
		mod_gzip_dechunk Yes
		mod_gzip_item_include file \.(html?|txt|css|js|php|pl)$
		mod_gzip_item_include handler ^cgi-script$
		mod_gzip_item_include mime ^text/.*
		mod_gzip_item_include mime ^application/x-javascript.*
		mod_gzip_item_exclude mime ^image/.*
		mod_gzip_item_exclude rspheader ^Content-Encoding:.*gzip.*
		</ifModule>';		
		
		file_put_contents(".htaccess",$str);
		}
		else
		{
			file_put_contents(".htaccess",$str);
		}
	}	
}

