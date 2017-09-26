module.exports = {
    summary: 'a rule to redirect a request',
    * beforeSendRequest(requestDetail) {
        const newRequestOptions = requestDetail.requestOptions;
        newRequestOptions.hostname = process.env.TARGET_HOST;
        newRequestOptions.port = process.env.TARGET_PORT;
        return {
            requestOptions: newRequestOptions
        };
    },
};