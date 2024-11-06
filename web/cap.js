const wdio = require('webdriverio');

async function runTest() {
    const client = await wdio.remote({
        hostname: 'localhost',
        port: 4723,
        path: '/wd/hub',
        capabilities: {
            platformName: 'Web',
            browserName: 'chrome',
            automationName: 'Flutter',
            app: 'http://localhost:your_flutter_web_app_port',
        },
    });

    // Locate a Flutter widget by its key
    const button = await client.$("flutter:byValueKey('submit_button_key')");
    await button.click();

    const textField = await client.$("flutter:byValueKey('input_field_key')");
    await textField.setValue('Hello, Flutter Web!');

    // Check the result after interaction
    const resultText = await client.$("flutter:byValueKey('result_text_key')");
    console.log(await resultText.getText());

    await client.deleteSession();
}

runTest().catch(console.error);