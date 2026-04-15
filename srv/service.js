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

		// for handling version fields
		const versions = req.data.versions;
		if (versions && versions.length > 0) {
			versions.forEach((v) => {
				const today = new Date().toISOString().split('T')[0];
				v.appl_date = today;
			})
		}
	});

	// update methods
	this.before(['CREATE', 'UPDATE'], Header, async (req) => {

		// using custom error messages for chassis number length
		if (req.data.chassis_no.length > 18) {
			req.error(400, 'Chassis Number is too long');
		}

		// console.log(req.data.versions);
		// for handling version fields
		const versions = req.data.versions;
		if (versions && versions.length > 0) {
			versions.forEach((v) => {
				const today = new Date().toISOString().split('T')[0];
				v.appl_date = today;
			})
		}
	})

	this.before(['CREATE', 'UPDATE'], 'Versions', (req) => {
		// Set application date to current date
		const today = new Date().toISOString().split('T')[0];
		req.data.appl_date = today;
	});

	this.after('READ', 'Header', (data) => {

		const records = Array.isArray(data) ? data : [data];

		records.forEach(d => {
			switch (d.processing_status_code) {
				case 'APPR':
					d.criticality = 3; // Green
					break;
				case 'WAIT':
					d.criticality = 2; // Yellow
					break;
				case 'REJE':
					d.criticality = 1; // Red
					break;
			}
		});
	});
});