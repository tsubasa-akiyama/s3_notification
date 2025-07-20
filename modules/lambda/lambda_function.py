def lambda_handler(event, context):
    import json
    import os
    import boto3

    sns = boto3.client('sns')

    detail = event.get("detail", {})
    bucket_name = detail.get("bucket", {}).get("name", "不明")
    object_key = detail.get("object", {}).get("key", "不明")
    size = detail.get("object", {}).get("size", "不明")
    time = event.get("time", "不明")

    message = (
        f"S3にファイルがアップロードされました。\n"
        f"時間: {time}\n"
        f"バケット名: {bucket_name}\n"
        f"ファイル名: {object_key}\n"
        f"サイズ: {size} バイト"
    )

    topic_arn = os.environ['SNS_TOPIC_ARN']

    sns.publish(
        TopicArn=topic_arn,
        Message=message,
        Subject='S3アップロード通知'
    )

    return {
        'statusCode': 200,
        'body': 'SNS通知を送信しました'
    }
