describe('Product page', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  it("There is product detail page will shows up", () => {
    cy.get(':nth-child(1) > a > img')
      .click()
      .url().should('include', '/products')
      .window().contains('The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.')
      .should('be.visible');
  })

});