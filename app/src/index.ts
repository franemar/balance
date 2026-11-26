import { SDK } from "@formance/formance-sdk";

const sdk = new SDK({
  serverURL: process.env.FORMANCE_SERVER_URL || "http://localhost:8080",
});

async function main() {
  const ledgerName = "default";

  // 1. Check Ledger server info
  const info = await sdk.ledger.v2.getInfo();
  console.log("Connected to Formance Ledger:", info);

  // 2. Create the ledger (ignores error if it already exists)
  try {
    await sdk.ledger.v2.createLedger({ ledger: ledgerName });
    console.log(`Created ledger: ${ledgerName}`);
  } catch (err) {
    console.log(`Ledger '${ledgerName}' ready.`);
  }

  // 3. Submit a Numscript transaction
  const txResponse = await sdk.ledger.v2.createTransaction({
    ledger: ledgerName,
    v2PostTransaction: {
      script: {
        plain: `
          send [USD/2 1500] (
            source = @world
            destination = @users:alice
          )
        `,
      },
    },
  });
  console.log("Transaction committed:", JSON.stringify(txResponse, null, 2));

  // 4. Query Alice's account balances and volumes
  const account = await sdk.ledger.v2.getAccount({
    ledger: ledgerName,
    address: "users:alice",
    expand: "volumes",
  });
  console.log("Alice account state:", JSON.stringify(account, null, 2));
}

// Wait briefly on initial startup to ensure Ledger HTTP server is listening
setTimeout(() => {
  main().catch((err) => {
    console.error("Error communicating with Formance Ledger:", err);
  });
}, 3000);
