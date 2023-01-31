describe('Product page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("There is product detail page will shows up", () => {
    cy.get(':nth-child(1) > a > img')
      .click()
    cy.url().should('include', '/products')
    cy.get(':nth-child(2) > p')  
      .contains('The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.')
      .should('be.visible');
  })

});