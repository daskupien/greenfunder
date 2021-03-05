const stripeAmount = () => {
  document
    .querySelector("#investment_investment_amount")
    .addEventListener("keyup", () => {
      const element = document.querySelector("#investment_investment_amount")
        .value;

      document
        .querySelector("#new_investment > script")
        .setAttribute("data-amount", `${element}`);
    });
};

export { stripeAmount };
