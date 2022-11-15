<?php

return [
    'title'                           => 'Settings',
    'email_setting_title'             => 'Email settings',
    'general'                         => [
        'theme'                                 => 'Theme',
        'description'                           => 'Setting site information',
        'title'                                 => 'General',
        'general_block'                         => 'General Information',
        'rich_editor'                           => 'Rich Editor',
        'site_title'                            => 'Site title',
        'admin_email'                           => 'Admin Email',
        'seo_block'                             => 'SEO Configuration',
        'seo_title'                             => 'SEO Title',
        'seo_description'                       => 'SEO Description',
        'webmaster_tools_block'                 => 'Google Webmaster Tools',
        'google_site_verification'              => 'Google site verification',
        'placeholder'                           => [
            'site_title'               => 'Site Title (maximum 120 characters)',
            'admin_email'              => 'Admin Email',
            'seo_title'                => 'SEO Title (maximum 120 characters)',
            'seo_description'          => 'SEO Description (maximum 120 characters)',
            'google_analytics'         => 'Google Analytics',
            'google_site_verification' => 'Google Site Verification',
        ],
        'cache_admin_menu'                      => 'Cache admin menu?',
        'enable_send_error_reporting_via_email' => 'Enable to send error reporting via email?',
        'time_zone'                             => 'Timezone',
        'default_admin_theme'                   => 'Default admin theme',
        'enable_change_admin_theme'             => 'Enable change admin theme?',
        'enable'                                => 'Enable',
        'disable'                               => 'Disable',
        'enable_cache'                          => 'Enable cache?',
        'cache_time'                            => 'Cache time (minutes)',
        'cache_time_site_map'                   => 'Cache Time Site map',
        'admin_logo'                            => 'Admin logo',
        'admin_favicon'                         => 'Admin favicon',
        'admin_title'                           => 'Admin title',
        'admin_title_placeholder'               => 'Title show to tab of browser',
        'cache_block'                           => 'Cache',
        'admin_appearance_title'                => 'Admin appearance',
        'admin_appearance_description'          => 'Setting admin appearance such as editor, language...',
        'seo_block_description'                 => 'Setting site title, site meta description, site keyword for optimize SEO',
        'webmaster_tools_description'           => 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website',
        'cache_description'                     => 'Config cache for system for optimize speed',
        'yes'                                   => 'Yes',
        'no'                                    => 'No',
        'show_on_front'                         => 'Your homepage displays',
        'select'                                => '— Select —',
        'show_site_name'                        => 'Show site name after page title, separate with "-"?',
        'locale'                                => 'Site language',
        'locale_direction'                      => 'Front site language direction',
        'admin_locale_direction'                => 'Admin language direction',
        'admin_login_screen_backgrounds'        => 'Login screen backgrounds (~1366x768)',
    ],
    'email'                           => [
        'subject'                       => 'Subject',
        'content'                       => 'Content',
        'title'                         => 'Setting for email template',
        'description'                   => 'Email template using HTML & system variables.',
        'reset_to_default'              => 'Reset to default',
        'back'                          => 'Back to settings',
        'reset_success'                 => 'Reset back to default successfully',
        'confirm_reset'                 => 'Confirm reset email template?',
        'confirm_message'               => 'Do you really want to reset this email template to default?',
        'continue'                      => 'Continue',
        'sender_name'                   => 'Sender name',
        'sender_name_placeholder'       => 'Name',
        'sender_email'                  => 'Sender email',
        'mailer'                        => 'Mailer',
        'port'                          => 'Port',
        'port_placeholder'              => 'Ex: 587',
        'host'                          => 'Host',
        'host_placeholder'              => 'Ex: smtp.gmail.com',
        'username'                      => 'Username',
        'username_placeholder'          => 'Username to login to mail server',
        'password'                      => 'Password',
        'password_placeholder'          => 'Password to login to mail server',
        'encryption'                    => 'Encryption',
        'mail_gun_domain'               => 'Domain',
        'mail_gun_domain_placeholder'   => 'Domain',
        'mail_gun_secret'               => 'Secret',
        'mail_gun_secret_placeholder'   => 'Secret',
        'mail_gun_endpoint'             => 'Endpoint',
        'mail_gun_endpoint_placeholder' => 'Endpoint',
        'log_channel'                   => 'Log channel',
        'sendmail_path'                 => 'Sendmail Path',
        'encryption_placeholder'        => 'Encryption: ssl or tls',

        'ses_key'                => 'Key',
        'ses_key_placeholder'    => 'Key',
        'ses_secret'             => 'Secret',
        'ses_secret_placeholder' => 'Secret',
        'ses_region'             => 'Region',
        'ses_region_placeholder' => 'Region',

        'postmark_token'             => 'Token',
        'postmark_token_placeholder' => 'Token',

        'template_title'              => 'Email templates',
        'template_description'        => 'Base templates for all emails',
        'template_header'             => 'Email template header',
        'template_header_description' => 'Template for header of emails',
        'template_footer'             => 'Email template footer',
        'template_footer_description' => 'Template for footer of emails',
        'default'                     => 'Default',
        'using_queue_to_send_mail'    => 'Using queue job to send emails (Must to setup Queue first https://laravel.com/docs/queues#supervisor-configuration)',
    ],
    'media'                           => [
        'title'                                         => 'Media',
        'driver'                                        => 'Driver',
        'description'                                   => 'Settings for media',
        'aws_access_key_id'                             => 'AWS Access Key ID',
        'aws_secret_key'                                => 'AWS Secret Key',
        'aws_default_region'                            => 'AWS Default Region',
        'aws_bucket'                                    => 'AWS Bucket',
        'aws_url'                                       => 'AWS URL',
        'aws_endpoint'                                  => 'AWS Endpoint (Optional)',
        'do_spaces_access_key_id'                       => 'DO Spaces Access Key ID',
        'do_spaces_secret_key'                          => 'DO Spaces Secret Key',
        'do_spaces_default_region'                      => 'DO Spaces Default Region',
        'do_spaces_bucket'                              => 'DO Spaces Bucket',
        'do_spaces_endpoint'                            => 'DO Spaces Endpoint',
        'do_spaces_cdn_enabled'                         => 'Is DO Spaces CDN enabled?',
        'media_do_spaces_cdn_custom_domain'             => 'Do Spaces CDN custom domain',
        'media_do_spaces_cdn_custom_domain_placeholder' => 'https://your-custom-domain.com',
        'wasabi_access_key_id'                          => 'Wasabi Access Key ID',
        'wasabi_secret_key'                             => 'Wasabi Secret Key',
        'wasabi_default_region'                         => 'Wasabi Default Region',
        'wasabi_bucket'                                 => 'Wasabi Bucket',
        'wasabi_root'                                   => 'Wasabi Root',
        'default_placeholder_image'                     => 'Default placeholder image',
        'enable_chunk'                                  => 'Enable chunk size upload?',
        'chunk_size'                                    => 'Chunk size (Bytes)',
        'chunk_size_placeholder'                        => 'Default: 1048576 ~ 1MB',
        'max_file_size'                                 => 'Chunk max file size (MB)',
        'max_file_size_placeholder'                     => 'Default: 1048576 ~ 1GB',
        'enable_watermark'                              => 'Enable watermark?',
        'watermark_source'                              => 'Watermark image',
        'watermark_size'                                => 'Size of watermark (%)',
        'watermark_size_placeholder'                    => 'Default: 10 (%)',
        'watermark_opacity'                             => 'Watermark Opacity (%)',
        'watermark_opacity_placeholder'                 => 'Default: 70 (%)',
        'watermark_position'                            => 'Watermark position',
        'watermark_position_x'                          => 'Watermark position X',
        'watermark_position_y'                          => 'Watermark position Y',
        'watermark_position_top_left'                   => 'Top left',
        'watermark_position_top_right'                  => 'Top right',
        'watermark_position_bottom_left'                => 'Bottom left',
        'watermark_position_bottom_right'               => 'Bottom right',
        'watermark_position_center'                     => 'Center',
        'turn_off_automatic_url_translation_into_latin' => 'Turn off automatic URL translation into Latin?',
        'bunnycdn_hostname'                             => 'Hostname',
        'bunnycdn_zone'                                 => 'Zone Name (The name of your storage zone)',
        'bunnycdn_key'                                  => 'FTP & API Access Password (The storage zone API Access Password)',
        'bunnycdn_region'                               => 'Region (The storage zone region)',
        'optional'                                      => 'Optional',
        'sizes'                                         => 'Media thumbnails sizes',
        'media_sizes_helper'                            => 'Set width or height to 0 if you just want to crop by width or height. Need to click on "Generate thumbnails" to apply changes.',
        'width'                                         => 'Width',
        'height'                                        => 'Height',
        'default_size_value'                            => 'Default: :size',
        'all'                                           => 'All',
        'media_folders_can_add_watermark'               => 'Add watermark for images in folders:',
    ],
    'license'                         => [
        'purchase_code' => 'Purchase code',
        'buyer'         => 'Buyer',
    ],
    'field_type_not_exists'           => 'This field type does not exist',
    'save_settings'                   => 'Save settings',
    'template'                        => 'Template',
    'description'                     => 'Description',
    'enable'                          => 'Enable',
    'send'                            => 'Send',
    'test_email_description'          => 'To send test email, please make sure you are updated configuration to send mail!',
    'test_email_input_placeholder'    => 'Enter the email which you want to send test email.',
    'test_email_modal_title'          => 'Send a test email',
    'test_send_mail'                  => 'Send test mail',
    'test_email_send_success'         => 'Send email successfully!',
    'locale_direction_ltr'            => 'Left to Right',
    'locale_direction_rtl'            => 'Right to Left',
    'saving'                          => 'Saving...',
    'emails_warning'                  => 'You can add up to :count emails',
    'email_add_more'                  => 'Add more',
    'generate'                        => 'Generate',
    'generate_thumbnails'             => 'Generate thumbnails',
    'generate_thumbnails_success'     => 'Generate thumbnails successfully. :count files are generated!',
    'generate_thumbnails_error'       => 'We are unable to regenerate thumbnail for these files :count files!',
    'generate_thumbnails_description' => 'Are you sure you want to re-generate thumbnails for all images? It will take time so please DO NOT leave this page, wait until it is finished.',
    'enable_chunk_description'        => 'Chunk size upload is used to upload large file size.',
    'watermark_description'           => 'WARNING: Watermark is just added to new uploaded images, it won\'t be added to existing images. Disable watermark won\'t remove watermark from existing images.',
];
