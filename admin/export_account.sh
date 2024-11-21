aws dynamodb scan --table-name CloudProjectMarkerTest-AwsAccountTable-7R91KTY5HWKQ --region us-east-1 \
--select ALL_ATTRIBUTES --page-size 500 --max-items 100000 --output json \
| jq -r '.Items' \
| jq -r 'map({User: .User.S, AwsAccountNumber: .AwsAccountNumber.S, Time: .Time.S}) | (.[0] | keys_unsorted) as $keys | $keys, map([.[ $keys[] ]])[] | @csv' \
> accounts.csv