const { json } = require("body-parser");
var express = require("express");
var router = express.Router();
var connection = require("../config/index");
const Razorpay = require("razorpay");

const razorpayInstance = new Razorpay({
  key_id: "rzp_test_W4byT86osE33RE",
  key_secret: "a3EJlsUVRvay6EdXVSQMTPPU",
});

/* GET home page. */
// router.post("/payment", function (req, res, next) {
//   var params = {};
//   params["MID"] = "dYCLtv04241463291282";
//   params["WEBSITE"] = "WEBSTAGING";
//   params["CHANNEL_ID"] = "WEB";
//   params["INDUSTRY_TYPE_ID"] = "Retail";
//   params["ORDER_ID"] = "TEST_" + new Date().getTime();
//   params["CUST_ID"] = "Customer001";
//   params["TXN_AMOUNT"] = "1.00";
//   params["CALLBACK_URL"] = `http://localhost:3001/payment/callback`;
//   params["EMAIL"] = "abc@mailinator.com";
//   params["MOBILE_NO"] = "7777777777";

//   try {
//     checksum_lib.genchecksum(
//       params,
//       "C7UK7o1je%fRZXSE",
//       function (err, checksum) {
//         res.send({ status: 200, data: params, checksum: checksum });
//       }
//     );
//   } catch (error) {
//     console.log("$$$$4");
//     console.log(error.message);
//   }
// });

// router.post("/callback", (req, res) => {
//   console.log(req.body);

//   var result = checksum_lib.verifychecksum(
//     req.body,
//     config.PaytmConfig.key,
//     req.body.CHECKSUMHASH
//   );

//   console.log("%%%%%%%%%%%%%%%%%%%55");
//   console.log(result);
//   // return new Promise((resolve, reject) => {
//   //   if (result) {
//   //     resolve(req.body);
//   //     // res.send(req.body)
//   //     // console.log("checksum match");
//   //     var a = connection.query(
//   //       "INSERT INTO  transaction_details " +
//   //         "( user_id, transaction_id, bank_txn_id, order_id, amount, " +
//   //         "status, txn_type, gateway_name, response_code, response_msg, bank_name, mid, payment_mode, " +
//   //         "refund_amount, transaction_date ) " +
//   //         "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ",
//   //       [
//   //         "1",
//   //         req.body.TXNID,
//   //         req.body.BANKTXNID,
//   //         req.body.ORDERID,
//   //         req.body.TXNAMOUNT,
//   //         req.body.STATUS,
//   //         req.body.TXNTYPE,
//   //         req.body.GATEWAYNAME,
//   //         req.body.RESPCODE,
//   //         req.body.RESPMSG,
//   //         req.body.BANKNAME,
//   //         req.body.MID,
//   //         req.body.PAYMENTMODE,
//   //         req.body.REFUNDAMT,
//   //         req.body.TXNDATE,
//   //       ]

//   //       // function (err, rows) {
//   //       //   // console.log(a.sql)
//   //       //   if (err) {
//   //       //     // throw err

//   //       //   } else {
//   //       //     res.redirect('http://localhost:8080/#/payment/200');
//   //       //   }
//   //       // }
//   //     );

//   if (req.body.STATUS == "TXN_SUCCESS") {
//     return res.redirect("http://localhost:3000/book-charge-station");
//   } else {
//     //return res.redirect("http://localhost:8080/#/payment/500");
//   }
//   //   } else {
//   //     // console.log("checksum not match");
//   //     return reject("ERROR");
//   //   }
//   // });
// });

/* RazorPay Payment */
router.post("/createOrder", function (req, res, next) {
  const { customerId, mapId, amount, currency } = req.body;
  console.log("%%%%%%%%%%");
  console.log(req.body);
  razorpayInstance.orders.create({ amount, currency }, (err, order) => {
    console.log("-----");
    console.log(order);
    if (!err) {
      const queryString = `INSERT INTO customer_station_mapping
      ( user_id, owner_station_mapping_id, razorpay_order_id, amount_paid, currency) 
      VALUES (?,?,?,?,?)`;
      connection.query(
        queryString,
        [customerId, mapId, order.id, amount, currency],
        function (err, result) {
          if (err) {
            res.send({
              status: 500,
              msg: err,
            });
          } else {
            res.send({ status: 200, data: order });
          }
        }
      );
    } else res.send(err);
  });
});

router.post("/callback/:customerId", (req, res) => {
  console.log("%%%%%%%%%%%%%%%%%%%55");
  console.log(req.body);
  console.log(req.params.customerId);
  const queryString = `UPDATE customer_station_mapping SET
  razorpay_payment_id = ?, razorpay_signature = ? 
  WHERE user_id = ? and razorpay_order_id = ?`;

  connection.query(
    queryString,
    [
      req.body.razorpay_payment_id,
      req.body.razorpay_signature,
      req.params.customerId,
      req.body.razorpay_order_id,
    ],
    function (err, result) {
      if (err) {
        res.redirect("http://localhost:3000/payment-failue");
      } else {
        res.redirect("http://localhost:3000/payment-success");
      }
    }
  );
});

module.exports = router;
