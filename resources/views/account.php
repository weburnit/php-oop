<html>
<body>
<h1>Hello, <?php echo $customer->getName() ?></h1>
<?php $accounts = $customer->getAccounts() ?>
<?php if (!count($accounts)): ?>
    <h2>Create your new account?</h2>
    <form action="/bank/account/<?php echo $customer->getKey() ?>" method="post">
        <select id="tier" name="tier">
            <option value="basic">Basic</option>
            <option value="platinum">Platinum</option>
        </select>
        <input type="text" name="deposit" placeholder="Deposit">
        <button>Submit</button>
    </form>
<?php else: ?>
    <?php foreach ($accounts as $account) { ?>
        <h2>Deposit?</h2>
        <form action="/bank/account/deposit/<?php $account->getKey() ?>" method="post">
            <input id="name" name="amount" type="text" placeholder="Your Name">
            <button>Submit</button>
        </form>
        <h2>Withdrawn?</h2>
        <form action="/bank/account/withdrawn/<?php $account->getKey() ?>" method="post">
            <input id="name" name="amount" type="text" placeholder="Your Name">
            <button>Submit</button>
        </form>
    <?php } ?>
<?php endif;
$transactions = $customer->getTransactions();
?>
<table>
    <thead>
    <tr>
        <th>Type</th>
        <th>Balance</th>
    </tr>
    </thead>
    <tbody>
    <? foreach ($transactions as $transaction) { ?>
        <tr>
            <td><?php echo $transaction->getType() ?></td>
            <td><?php echo $transaction->getBalance() ?></td>
        </tr>
    <?php } ?>
    </tbody>
</table>
</body>
</html>