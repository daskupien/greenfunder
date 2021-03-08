const stripeAmount = () => {
  document
    .querySelector("#investment_investment_amount_cents")
    .addEventListener("keyup", () => {
      const element = document.querySelector(
        "#investment_investment_amount_cents"
      ).value;

      document
        .querySelector("#new_investment > script")
        .setAttribute("data-amount", `${element}`);
    });
};

export { stripeAmount };
