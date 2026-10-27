import cds from '@sap/cds';

export default cds.service.impl(async function() {
    const { Orders } = this.entities;

    this.before(['CREATE', 'UPDATE'], Orders, async (req) => {
        const data = req.data;
        if (data.items && data.items.length > 0) {
            data.totalAmount = data.items.reduce((sum, item) => {
                return sum + (Number(item.quantity || 0) * Number(item.price || 0));
            }, 0);
        }
    });
});
