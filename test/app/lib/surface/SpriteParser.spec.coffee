SpriteParser = require('lib/sprites/SpriteParser')
SpriteParserAnimate = require('lib/sprites/SpriteParserAnimate')
ThangType = require 'models/ThangType'


# ninjaWalktest data from `.js` files exported by Flash and Animate respectively.
ninjaWalkFlash = require('test/app/fixtures/spriteParser/NinjaWalk_flash')
ninjaWalkAnimate = require('test/app/fixtures/spriteParser/NinjaWalk_animate')

describe 'SpriteParser', ->
  it 'returns correct data for NinjaWalk from flash and animate files.', ->
    thangTypeFlash = new ThangType(_id: "id")
    thangTypeAnimate = new ThangType(_id: "id")

    parser = new SpriteParser(thangTypeFlash)
    parser.parse(ninjaWalkFlash)

    parserAnimate = new SpriteParserAnimate(thangTypeAnimate)
    parserAnimate.parse(ninjaWalkAnimate)
    
    expect(thangTypeFlash.get('raw').shapes).toEqual(thangTypeAnimate.get('raw')?.shapes)


    # expect(thangTypeFlash.attributes)
    

    # expect(thangTypeFlash).toEqual(thangTypeAnimate)