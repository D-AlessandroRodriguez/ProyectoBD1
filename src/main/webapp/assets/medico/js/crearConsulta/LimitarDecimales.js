class LimitarDecimales{
	static limitDecimalPlaces(event, count) {
		const value = event.target.value;
		if (value.includes(".")) {
			const [integer, decimal] = value.split(".");
			if (decimal.length > count) {
				event.target.value = `${integer}.${decimal.substring(0, count)}`;
			}
		}
	}
}