Certainly! Let's simplify the README file for easy understanding:

---

# Client-Side Encryption with Ruby on Rails and Active Storage for Amazon S3

## Introduction

This guide helps you enhance the security of your web application by adding client-side encryption. It's a way to make sure your data is super safe when you store it in the cloud. We'll focus on using Ruby on Rails and Active Storage with Amazon S3, a popular cloud storage service.

## What's Client-Side Encryption?

Client-side encryption is like putting your data in a super secure box before sending it to the cloud. Even if someone sneaks into the cloud, they won't see your secrets because everything's locked up tight.

## Active Storage, What's That?

Active Storage is a cool feature in Ruby on Rails. It makes it easy to send files to cloud storage services like Amazon S3. You can attach files to things like user profiles or documents without worrying too much about the storage part.

## Getting Ready with Encryption Key

Before we start, you need a secret code, called an encryption key. This key will lock and unlock your data. You can make one yourself or use a key managed by Amazon (AWS). We'll use Amazon's key for our example.

## Let's Dive into Code

We'll extend Active Storage's built-in S3 service to make it do client-side encryption magic. It sounds complex, but don't worry; we'll break it down step by step.

## How to Set It Up

1. Create a new file: `lib/active_storage/service/encrypted_s3_service.rb`.
2. Write some code in it. (We'll provide you with code examples.)
3. Update your storage configuration in `config/storage.yml`. (We'll provide the settings.)

## Multiple Buckets? No Problem

If you have some data that doesn't need encryption and some that do, you can separate them. We'll show you how to use multiple buckets for this.

## Testing, Development, and Production

When you're testing your code, you might not want to mess with your real data. We'll help you set up different storage configurations for different situations.
# Setup

### Step 1: Create `lib/active_storage/service/encrypted_s3_service.rb`

In your Rails application, create a new file: `lib/active_storage/service/encrypted_s3_service.rb`. This file will contain the code for the encrypted S3 service.

```ruby
# frozen_string_literal: true

require 'active_storage/service/s3_service'

module ActiveStorage
  class Service::EncryptedS3Service < Service::S3Service
    attr_reader :encryption_client

    def initialize(bucket:, upload: {}, **options)
      super_options = options.except(:kms_key_id, :encryption_key, :key_wrap_schema, :content_encryption_schema, :security_profile)
      super(bucket: bucket, upload: upload, **super_options)
      @encryption_client = Aws::S3::EncryptionV2::Client.new(options)
    end

    def upload(key, io, checksum: nil, **)
      instrument :upload, key: key, checksum: checksum do
        @encryption_client.put_object(
          upload_options.merge(body: io, bucket: bucket.name, key: key)
        )
      rescue Aws::S3::Errors::BadDigest
        raise ActiveStorage::IntegrityError
      end
    end

    def download(key)
      instrument :download, key: key do
        @encryption_client.get_object(bucket: bucket.name, key: key).body.string.force_encoding(Encoding::BINARY)
      end
    end
  end
end
```

### Step 2: Configure `config/storage.yml`

In your `config/storage.yml` file, declare the new service settings for Amazon S3 with client-side encryption:

```yaml
amazon_encrypted:
  service: EncryptedS3
  region: <your_region>
  bucket: <your_bucket_name>
  kms_key_id: alias/<your_kms_key_id>
  key_wrap_schema: :kms_context
  content_encryption_schema: :aes_gcm_no_padding
  security_profile: :v2
```

### Step 3: Set the Default Storage Service (Optional)

In your application configuration file (e.g., `config/application.rb`), you can set the default storage service. For example, if you want to use the encrypted S3 service by default:

```ruby
config.active_storage.service = :amazon_encrypted
```

### Step 4: Attach Files to Records

In your models, when you want to attach files to records that will be stored using the encrypted service, you can specify the service option like this:

```ruby
class User < ApplicationRecord
  has_one_attached :avatar, service: :amazon_encrypted
end
```

With this basic setup, you'll have client-side encryption for your files stored in Amazon S3 using Ruby on Rails and Active Storage. Make sure to replace placeholders like `<your_region>`, `<your_bucket_name>`, and `<your_kms_key_id>` with your actual configuration details.
