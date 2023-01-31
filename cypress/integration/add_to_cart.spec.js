describe('Add item to cart', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  it("Add product in to cart and show how many product in cart", () => {
    cy.get('.add_btn')
      .click({force: true})
    cy.get('.end-0 > .nav-link')
      .contains("1")
  })

});