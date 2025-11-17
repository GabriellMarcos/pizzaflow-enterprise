const { test, expect } = require('@playwright/test');

test.describe('Pizza Ordering E2E', () => {
  test('should display pizza menu', async ({ page }) => {
    await page.goto('http://localhost:3000');
    
    // Check if pizzas are loaded
    await expect(page.locator('.pizza-card')).toHaveCount(4);
    
    // Check pizza details
    await expect(page.locator('text=Margherita')).toBeVisible();
    await expect(page.locator('text=R$ 25.90')).toBeVisible();
  });

  test('should create a new pizza order', async ({ page }) => {
    await page.goto('http://localhost:3000');
    
    // Click order button for first pizza
    await page.click('.order-btn:first-child');
    
    // Fill order form
    await page.fill('#customerName', 'João Silva');
    await page.click('button[type="submit"]');
    
    // Check success message
    await expect(page.locator('.status')).toContainText('Pedido realizado com sucesso');
    
    // Verify order appears in orders list
    await expect(page.locator('.order-card')).toHaveCount(1);
    await expect(page.locator('.order-card')).toContainText('João Silva');
  });

  test('should handle API errors gracefully', async ({ page }) => {
    // Mock API failure
    await page.route('**/api/pizzas', route => route.abort());
    
    await page.goto('http://localhost:3000');
    
    // Should show error state
    await expect(page.locator('text=Erro ao carregar pizzas')).toBeVisible();
  });
});