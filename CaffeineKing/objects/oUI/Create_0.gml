
injectButton = create_button(1280-100, 150, 64, 64);
injectButton.sprite_index = sInject;
injectButton.hoverTitle = "Inject coffee";
injectButton.hoverText = "Injects coffee into the King's blood-stream"

inject10Button = noone;

injectValue = 0.4;



peasantButton = create_button(1280-130, 300, 64, 64);
peasantButton.sprite_index = sPeasantButton;
peasantButton.hoverTitle = "Peasant - 10 coffee";
peasantButton.hoverText = "Harvests coffee... trees? bushes? plants?";


farmButton = create_button(1280-55, 300, 64, 64);
farmButton.sprite_index = sFarmButton;
farmButton.hoverTitle = "Farmer - 25 coffee"
farmButton.hoverText = "Plants new coffee plants that take a while to sprout";


buxButton = create_button(1280-130, 375, 64, 64);
buxButton.sprite_index = sBuxButton;
buxButton.hoverTitle = "Sunbux - 50 coffee"
buxButton.hoverText = "Motivates workers by consuming a small amount of coffee";


tryingToPlace = noone;

drawSpriteAtMouse = noone;
placingColor = -1;