<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Thanks for joining our email list</title>
    <style>
        .page { max-width: 560px; margin: 48px auto; font: 16px/1.5 Arial, Helvetica, sans-serif; }
        .info { margin-top: 12px; }
        .row {
            display: grid;
            grid-template-columns: 140px 1fr;
            gap: 10px;
            margin: 6px 0;
            align-items: center;
        }
        .label { font-weight: 600; }
        .actions { margin-top: 18px; }
        button { padding: 6px 12px; }
        .heading-blue { color:#007bff; }  /* thêm dòng này */
    </style>
</head>
<body>
<div class="page">
    <h1 class="heading-blue">Thanks for joining our email list</h1>
    <p>Here is the information that you entered:</p>

    <div class="info">
        <div class="row"><div class="label">Email:</div><div>${user.email}</div></div>
        <div class="row"><div class="label">First Name:</div><div>${user.firstName}</div></div>
        <div class="row"><div class="label">Last Name:</div><div>${user.lastName}</div></div>
    </div>

    <p class="actions">
        To enter another email address, click on the Back button in your browser or the Return button below.
    </p>

    <form action="index.html" method="get">
        <button type="submit">Return</button>
    </form>
</div>
</body>
</html>
