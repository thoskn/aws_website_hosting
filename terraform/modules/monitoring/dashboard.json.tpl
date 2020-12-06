{
    "widgets": [
        {
            "type": "metric",
            "x": 0,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "AWS/CloudFront", "Requests", "Region", "Global", "DistributionId", "${cloudfront_distribution_id}" ]
                ],
                "region": "us-east-1",
                "title": "Requests",
                "yAxis": {
                    "left": {
                        "showUnits": true,
                        "label": "Count"
                    },
                    "right": {
                        "showUnits": false
                    }
                },
                "stat": "Sum",
                "period": 300
            }
        },
        {
            "type": "metric",
            "x": 6,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "AWS/CloudFront", "BytesUploaded", "Region", "Global", "DistributionId", "${cloudfront_distribution_id}" ],
                    [ ".", "BytesDownloaded", ".", ".", ".", "." ]
                ],
                "region": "us-east-1",
                "title": "Data transfer",
                "yAxis": {
                    "left": {
                        "showUnits": false,
                        "label": "Bytes"
                    },
                    "right": {
                        "showUnits": false
                    }
                },
                "period": 300
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 0,
            "width": 6,
            "height": 6,
            "properties": {
                "view": "timeSeries",
                "stacked": false,
                "metrics": [
                    [ "AWS/CloudFront", "4xxErrorRate", "Region", "Global", "DistributionId", "${cloudfront_distribution_id}" ],
                    [ ".", "5xxErrorRate", ".", ".", ".", "." ]
                ],
                "region": "us-east-1",
                "title": "Error rate",
                "yAxis": {
                    "left": {
                        "showUnits": true
                    },
                    "right": {
                        "showUnits": false
                    }
                },
                "period": 300
            }
        }
    ]
}
