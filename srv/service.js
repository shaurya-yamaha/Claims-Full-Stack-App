const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

  const { Header } = this.entities;

  this.before('CREATE', Header, async (req) => {

    const tx = cds.transaction(req);

    // Get max claim value
    const result = await tx.run(
      SELECT.one.from(Header).columns('max(claim) as maxClaim')
    );

    let nextClaim = 1;

    if (result && result.maxClaim) {
      nextClaim = result.maxClaim + 1;
    }

    req.data.claim = nextClaim;
  });

});