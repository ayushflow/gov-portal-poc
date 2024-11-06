const wdio = require('webdriverio');

async function runTest() {
    // Set up Appium client with the desired capabilities
    const client = await wdio.remote({
        hostname: 'localhost',
        port: 4723,
        path: '/wd/hub',
        // automationName: 'Flutter',
        // app: 'http://localhost:60545',
        capabilities: {
            platformName: 'Desktop',
            browserName: 'chrome', // can also use 'firefox'
            'appium:automationName': 'Flutter',
            'appium:app': 'http://localhost:58727', // replace with your Flutter web app's local URL
        },
    });

    // Interact with Flutter elements using their keys
    const button = await client.$("flutter:byValueKey('submit_button_key')");
    await button.click();

    const textField = await client.$("flutter:byValueKey('input_field_key')");
    await textField.setValue('Hello, Flutter Web!');

    const resultText = await client.$("flutter:byValueKey('result_text_key')");
    console.log(await resultText.getText());

    // End the session
    await client.deleteSession();
}

// Run the test
runTest().catch(console.error);
