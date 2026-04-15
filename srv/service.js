const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

  const { Header } = this.entities;

  this.before('CREATE', Header, async (req) => {

  const tx = cds.transaction(req);

  const result = await tx.run(
    SELECT.from(Header).columns('claim').orderBy('claim desc').limit(1)
  );

  let nextClaim = 1;

  if (result.length > 0 && result[0].claim) {
    nextClaim = result[0].claim + 1;
  }

  req.data.claim = nextClaim;
});

});